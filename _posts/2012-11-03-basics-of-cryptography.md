---
layout: post
title: "Basics of Cryptography"
author: "Max Ciotti"
date: 2012-11-03
categories: Overview
---

How secure would you say your email, your Facebook, Tumblr, Dropbox, password manager, or any such service actually is? Would it surprise you to find out that your personal data on any such service can easily be compromised if you fail to take the necessary precautions? If you are not surprised, then excellent, you at least understand the seriousness of the situation and perhaps even know what you can do to protect yourself from attackers. If you were surprised, don't worry, you are part of the majority of the population, but at least you are in the right place. **[Cryptography](/about#cryptography)**, the process or skill of communicating in or deciphering secret writings or ciphers, is the foundation providing a layer of security between your personal data and attackers who wish to steal such information and often distribute it or use it for nefarious purposes such as identity theft. So how can we protect ourselves?

Cryptography is all about private communication. However, this does not mean face-to-face let's-have-a-chat-style communication, but rather private communication through a public medium. Now just how is that possible? It turns out there is a handy concept called **[encryption](/about#encryption)**, which allows us to hide a plain message according to a certain scheme that will prevent any eavesdroppers or hackers from interpreting that message, while still allowing the recipient to understand it.

It may be helpful to imagine a military base of operations which wishes to communicate to one or more of its naval vessels some attack strategy updates. Now, if the enemy were to intercept this message, they would be fully aware of our strategies and would start to assemble defenses in preparation of attack. Because radio transmissions are not direct, any naval vessel can listen to the message. In order to prevent the enemy from listening in on our attack strategies, we must encrypt our message according to a pre-determined protocol that only our ships have knowledge of. In essence, this is as if we agree upon an encryption algorithm (such as Morse Code but perhaps the letters are mixed up so the enemy does not know which letter corresponds to which code) and write down this scheme in our books so we can translate messages. Great! Now we can send messages securely over a public channel, right?

Wrong. While the concept is essentially correct, it is not fool-proof. Without careful consideration, any such encryption algorithm can be cracked. If our enemies are smart enough, they will perform some operations on our encrypted message to pry at its underlying meaning. If not encrypted using a secure enough algorithm, our enemies could be able to find the true meaning in a matter of minutes. This is why it is crucial to ensure the encryption algorithm is secure enough for its purpose, which is a huge part of **[cryptanalysis](/about#cryptanalysis)**.

On top of message encryption, cryptography plays a significant role in many areas of science and technology. The following are just a few of the numerous uses of cryptographic techniques:

* Authentication (i.e. logging in to a website or application)
* Digital Signatures (to validify the integrity of a message)
* Anonymous Internet Banking
* Electronic Voting

None of these concepts could exist without the foundation that is set in place by cryptography, and without them, neither could any of your favorite applications, email, online games, or even phone calls and text messages. In this age of instant communication and information sharing, cryptography is becoming increasingly crucial to the functioning of our daily lives.
