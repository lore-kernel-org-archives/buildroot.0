From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Sep 2019 12:30:15 +0200
Subject: [Buildroot] [PATCH 1/2] package/haveged: bump to version 1.9.6
In-Reply-To: <1568142431-9159-1-git-send-email-pjtexier@koncepto.io>
 (Pierre-Jean Texier's message of "Tue, 10 Sep 2019 21:07:10 +0200")
References: <1568142431-9159-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <87blvrunuw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pierre-Jean" == Pierre-Jean Texier <pjtexier@koncepto.io> writes:

 > This includes the following changes:
 > 94079e6 Fixed invalid UTF-8 codes in ChangeLog
 > 1470a82 Updated service.fedora
 > 9596c53 Updated service.fedora
 > b50b59b New version 1.9.5
 > 037e059 New version 1.9.5
 > 2681d01 Added test for /dev/random symlink
 > 0dac21b Update to automake 1.16
 > 638e2f0 Fixed built issue on Cygwin
 > 083f827 minimize diff
 > b38def1 minimize diff
 > e16369d take into account review by @nbraud
 > 6dfce53 Remove support for CPUID on ia64
 > fc50dda [PATCH] Output some progress during CUSUM and RANDOM EXCURSION test
 > be4e481 NEWS: Cleanup extraneous whitespace
 > 0815b3c Fixup upstream changelog
 > 6d52229 Fix type mismatch in get_poolsize
 > 90d00f7 service.redhat: update PIDFile
 > 16a9726 fix segv at start
 > ceab89a init.d/Makefile.am: add missing dependency
 > 01e3154 Diagnostics capture mode now works correctly by referencing the right variable during rng warmup
 > f219358 Fix segfault on arm machines

Given this, should this version bump also be backported to 2019.02.x and
2019.08.x? Do you know when the issue was introduced?

-- 
Bye, Peter Korsgaard
