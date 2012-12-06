# CAKEFILE #

## BEGIN CONFIGURATION ##

ENVIRONMENT = 'development'

CP_LIB = 'cp -ru [OPTIONS]... INPUT OUTPUT'

JS =
	lang: 'coffee'
	compiler: 'coffee [OPTIONS]... -o OUTPUT -c INPUT'
	lib_dir: 'scripts/lib/'
	src_dir: 'scripts/'
	target_dir: 'public/js/'
	output_to_file: false

CSS =
	lang: 'less'
	compiler: 'lessc [OPTIONS]... INPUT OUTPUT'
	lib_dir: 'styles/lib/'
	src_dir: 'styles/'
	target_dir: 'public/css/'
	output_to_file: true
	theme_name: 'limitless'

## END CONFIGURATION ##

fs = require 'fs'
{exec} = require 'child_process'
util = require 'util'
path = require 'path'

getSources = (src_dir, ext) ->
	sources = []
	pattern = new RegExp "\\.#{ext}$", 'i'

	if fs.existsSync src_dir
		sources.push src for src in fs.readdirSync src_dir when pattern.test(src) and fs.statSync(path.join(src_dir, src)).isFile()
		return sources
	else
		console.error "Directory '%s' does not exist", src_dir

execute = (executable, input, output, options = []) ->
	regex_input = /INPUT/
	regex_output = /OUTPUT/
	regex_options = /\[OPTIONS\]\.{3}/i

	if regex_input.test executable
		executable = executable.replace regex_input, input
	else
		console.error 'Malformed executable: could not find \'INPUT\''
		util.puts executable
		return

	if regex_output.test executable
		executable = executable.replace regex_output, output
	else
		console.error 'Malformed executable: could not find \'OUTPUT\''
		util.puts executable
		return

	if regex_options.test executable
		executable = executable.replace regex_options, options.join(' ')

	# console.log executable

	exec executable, (err, stdout, stderr) ->
		if err
			throw err
			util.puts executable

watch = (src_dir, src, compile) ->
	file = path.join src_dir, src
	fs.watchFile file, (current, previous) ->
		if current.mtime.getTime() isnt previous.mtime.getTime()
			util.log "Change detected in #{file}"
			compile src

build = (lang, options) ->
	lib_target = path.join lang.target_dir, 'lib'
	lib_path = lib_target.split path.sep
	lib_dir = path.join lang.lib_dir, './*'
	for dir, i in lib_path
		current_path = lib_path[0..i].join path.sep
		if not fs.existsSync current_path
			exec "mkdir #{current_path}", (err, stdout, stderr) -> throw err if err

	execute CP_LIB, lib_dir, lib_target

	valid_theme = /^[a-zA-z0-9_-]+$/

	ext = ''

	if lang is CSS
		ext = 'css'
		if options.hasOwnProperty 'theme'
			if valid_theme.test options.theme
				lang.src_dir = path.join lang.src_dir, options.theme
			else
				console.error 'Invalid theme name: %s', options.theme
				return
		else
			lang.src_dir = path.join lang.src_dir, CSS.theme_name
	else if lang is JS
		ext = 'js'

	if not lang.hasOwnProperty 'sources'
		lang.sources = getSources lang.src_dir, lang.lang

	compiler = (src) ->
		file = path.join lang.src_dir, src
		util.log "Compiling #{file}"
		if lang.output_to_file
			filename = path.basename(src, '.' + lang.lang) + '.' + ext
			target = path.join lang.target_dir, filename
			execute lang.compiler, file, target
		else
			execute lang.compiler, file, lang.target_dir

	if not options.watch
		console.log "Compiling all #{lang.lang} files to #{lang.target_dir}"
		compiler src for src in lang.sources
		util.log "Complete!"
	else
		console.log "Watching for changes in #{lang.src_dir}"
		watch lang.src_dir, src, compiler for src in lang.sources

# util.puts 'Usage: cake [OPTION]... [TASK]             (1st form)'
# util.puts '  or:  cake [OPTION]... -t [THEME] [TASK]  (2nd form)\n'

option '-w', '--watch', 'Watch sources and build changes'
option '-t', '--theme [THEME]', 'Set a custom theme to be built'

task 'build:js', 'Build all JavaScript sources', (options) ->
	build JS, options

task 'build:css', 'Build all CSS sources', (options) ->
	build CSS, options

task 'build', 'Build all sources', ->
	invoke 'build:js'
	invoke 'build:css'

task 'clean:js', 'Clean the JavaScript target directory', ->
	util.puts "Not yet implemented"

task 'clean:css', 'Clean the CSS target directory', ->
	util.puts "Not yet implemented"

task 'clean', 'Clean all target directories', ->
	invoke 'clean:js'
	invoke 'clean:css'