From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Mar 2012 11:44:32 +0100
Subject: [Buildroot] [PATCH] linux.mk: .ub-File copying after building
	initramfs
In-Reply-To: <1332292744-11797-1-git-send-email-markus.kaindl@stusta.mhn.de>
 (Markus Kaindl's message of "Wed, 21 Mar 2012 02:19:04 +0100")
References: <1332292744-11797-1-git-send-email-markus.kaindl@stusta.mhn.de>
Message-ID: <87y5qu44j3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Kaindl <markus.kaindl@stusta.mhn.de> writes:

 Markus> test should exit with Exit-Code 0 if no .ub-File present and copy the
 Markus> file if Exit-Code 1, otherwise make fails

Committed, thanks.

-- 
Bye, Peter Korsgaard
