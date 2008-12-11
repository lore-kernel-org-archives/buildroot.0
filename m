From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 12 Dec 2008 00:57:58 +0100
Subject: [Buildroot] dropbear & openssh transfers are limited to about
	800k !?
In-Reply-To: <4940EDF4.7040400@gin.de> (Andreas Kuehn's message of "Thu\,
	11 Dec 2008 11\:39\:48 +0100")
References: <4940C961.7080602@gin.de> <87ljunkojx.fsf@macbook.be.48ers.dk>
	<4940EDF4.7040400@gin.de>
Message-ID: <87bpvil0xl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andreas" == Andreas Kuehn <Andreas.Kuehn@gin.de> writes:

Hi,

 Andreas> Fine hearing that it should work as expected.

 Andreas> About the memory capacity:
 Andreas> Mem: 8612K used, 118892K free, 0K shrd, 320K buff, 5168K cached
 Andreas> rootfs: 119.5M used, 56.0M free

 Andreas> I still expect something like that ext2-fs has some
 Andreas> limitation or uClibc

Ext2? Are you using an initrd? How much space do you have free?

-- 
Bye, Peter Korsgaard
