From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 11 Apr 2008 23:32:26 +0200
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/u-boot
In-Reply-To: <47FFD045.8080102@eclis.ch> (Jean-Christian de Rivaz's message of
	"Fri\, 11 Apr 2008 22\:55\:33 +0200")
References: <20080410210327.E728B3C5B8@busybox.net> <47FFD045.8080102@eclis.ch>
Message-ID: <87lk3k3wnp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jean-Christian" == Jean-Christian de Rivaz <jc@eclis.ch> writes:

 Jean-Christian> Thanks Ulf for this fix. I have found two others
 Jean-Christian> files with the exact same issue:
 Jean-Christian> target/device/Atmel/at91bootstrap/at91bootstrap.mk
 Jean-Christian> target/linux/Makefile.in.advanced

 Jean-Christian> Please apply the attached patch to fix them.

Thanks - fixed in r21712.

-- 
Bye, Peter Korsgaard
