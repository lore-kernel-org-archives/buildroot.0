From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jan 2012 15:26:33 +0100
Subject: [Buildroot] Cant type anything into Serial Console login
In-Reply-To: <4F0D9B42.2070604@labri.fr> (Jigar SOLANKI's message of "Wed, 11
 Jan 2012 15:22:58 +0100")
References: <4F0D76AB.7000508@labri.fr> <8739bmbb3o.fsf@macbook.be.48ers.dk>
 <4F0D9B42.2070604@labri.fr>
Message-ID: <87y5te9uxy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jigar" == Jigar SOLANKI <jigar.solanki@labri.fr> writes:

 >> Seems good. Can you interact with the shell over serial if you boot with
 >> init=/bin/sh ?
 >> 

 Jigar> Nope. It hangs on Booting Linux...and that's all. I can't do anything,
 Jigar> can't type anything on keyboard.

You did keep the console=.. part, right? What is your entire kernel
cmdline?

-- 
Bye, Peter Korsgaard
