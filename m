From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 01 Apr 2011 14:57:07 +0200
Subject: [Buildroot] [PATCH] Add support to specify special Kernel Image
	make target
In-Reply-To: <1300729183-29401-1-git-send-email-mort@bork.org> (Martin Hicks's
	message of "Mon, 21 Mar 2011 13:39:43 -0400")
References: <1300729183-29401-1-git-send-email-mort@bork.org>
Message-ID: <874o6i2kpo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Hicks <mort@bork.org> writes:

 Martin> This is useful for ARCHes like PowerPC that have a whole lot of
 Martin> special targets for each different board.  The kernel image target
 Martin> tells make which OpenFirmware machine description file is combined into
 Martin> the kernel binary.

Committed with a bit of tweaks to the long help text lines, thanks.

-- 
Bye, Peter Korsgaard
