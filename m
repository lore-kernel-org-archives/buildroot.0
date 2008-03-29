From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 29 Mar 2008 16:25:54 +0100
Subject: [Buildroot] adding packages to buildroot
In-Reply-To: <1206803522.3224.186.camel@nigel-x60> (Nigel Kukard's message of
	"Sat\, 29 Mar 2008 15\:12\:02 +0000")
References: <1206803522.3224.186.camel@nigel-x60>
Message-ID: <87abkh8scd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nigel" == Nigel Kukard <nkukard@lbsd.net> writes:

 Nigel> Anybody got anything against me adding and maintaining the following
 Nigel> packages...

 Nigel> rpm5 - 4.4.9 & 5.0.x (+- 9 patches to support uclibc)
 Nigel> depends: libneon
 Nigel> depends: libbeecrypt

 Nigel> busybox's rpm is great, but lacks functionality which one can use for
 Nigel> emergency recovery.

 Nigel> bootutils - implements a switchroot alternative which supports automatic
 Nigel> discovery of root device/filesystem and emergency shell execution if
 Nigel> root device cannot be found or mounted. initramfs+bootutils+busybox
 Nigel> +dropbear  <= perfect rescue initramfs/initrd.

No, sounds fine - The ipkg package manager also recently got added.

-- 
Bye, Peter Korsgaard
