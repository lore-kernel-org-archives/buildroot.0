From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Sep 2008 12:27:41 +0200
Subject: [Buildroot] 2.6.26 crashes on at91sam9260ek
In-Reply-To: <cfb54190809160021g5bd3ae86o291a3f813d58f67f@mail.gmail.com> (Hai
	Zaar's message of "Tue\, 16 Sep 2008 10\:21\:24 +0300")
References: <76d9e2a30809150900r5749d886r40425c5b8809b508@mail.gmail.com>
	<87iqsxb6qj.fsf@macbook.be.48ers.dk>
	<cfb54190809160021g5bd3ae86o291a3f813d58f67f@mail.gmail.com>
Message-ID: <87y71s8jxe.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hai" == Hai Zaar <haizaar@haizaar.com> writes:

Hi,

 >> Sorry I don't have access to any at91 boards (Ulf, you told me long
 >> time ago you could provide me with one) - Does the new kernel work
 >> with the old file system and/or old kernel with new file system?
 Hai> It does not even come the the stage to talk about file system. It
 Hai> crashes way before it tries to mount ramdisk.

Ahh, sorry - I missed that. So it seems like the Atmel patches are
buggy. I don't know anything about them or why they're not upstream,
but I guess from here on it's up to you (and the Atmel people) to
debug it or move back to the old kernel.

-- 
Bye, Peter Korsgaard
