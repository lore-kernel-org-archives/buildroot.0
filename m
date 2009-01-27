From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 17:48:44 +0100
Subject: [Buildroot] bfd lib include Error while build elf2flt
In-Reply-To: <3a665c760901270846y7ccc4adak9c49fbc82618bfa0@mail.gmail.com>
	(loody's message of "Wed\, 28 Jan 2009 00\:46\:09 +0800")
References: <3a665c760901270846y7ccc4adak9c49fbc82618bfa0@mail.gmail.com>
Message-ID: <87iqo0zocz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "loody" == loody  <miloody@gmail.com> writes:

 loody> Dear all:
 loody> While compiling elf2flt, the buildroot shows the error message as
 loody> attach at the end of this mail.
 loody> I try to rebuild the binuitilies, but it still fail.
 loody> If anyone has the same problem or knows where I get wrong, please let me know.
 loody> appreciate your help,
 loody> miloody

 loody> undefined reference to `inflateInit_'
 loody> /media/sda6/uclinux/buildroot-2009.02-rc2/toolchain_build_arm/binutils-2.19/bfd/compress.c:103:
 loody> undefined reference to `inflate'
 loody> /media/sda6/uclinux/buildroot-2009.02-rc2/toolchain_build_arm/binutils-2.19/bfd/compress.c:106:
 loody> undefined reference to `inflateReset'
 loody> /media/sda6/uclinux/buildroot-2009.02-rc2/toolchain_build_arm/binutils-2.19/bfd/compress.c:108:

Don't know anything about elf2flt, but it seems like it needs to link
to zlib.

-- 
Bye, Peter Korsgaard
