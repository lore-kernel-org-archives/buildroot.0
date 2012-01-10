From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Jan 2012 13:48:52 +0100
Subject: [Buildroot] [PATCH] python-netifaces: add -x option to fix
	cross-compilation
In-Reply-To: <4F0AC41E.6030701@visionsystems.de> (Yegor Yefremov's message of
 "Mon, 09 Jan 2012 11:40:30 +0100")
References: <1326094927-27207-1-git-send-email-yegorslists@googlemail.com>
 <8739bpffv1.fsf@macbook.be.48ers.dk>
 <4F0ABA03.3030206@visionsystems.de> <20120109112018.64832095@skate>
 <87y5thduyo.fsf@macbook.be.48ers.dk>
 <4F0AC41E.6030701@visionsystems.de>
Message-ID: <87y5tfd8p7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:


 Yegor> I've activated UCLIBC_SUPPORT_AI_ADDRCONFIG and now I can
 Yegor> compile netifaces without a problem with native toolchain. Here
 Yegor> is my .config for reference. Also take a look at this thread:
 Yegor> http://lists.busybox.net/pipermail/uclibc/2008-August/040778.html

Thanks. I added (and sent upstream) a patch to get netifaces to build
without ADDRCONFIG.

-- 
Bye, Peter Korsgaard
