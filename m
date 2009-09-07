From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Sep 2009 07:35:19 +0200
Subject: [Buildroot] coreutils build failing
In-Reply-To: <4AA3EBC6.3080306@rodgers.sdcoxmail.com> (Stephen Rodgers's
	message of "Sun\, 06 Sep 2009 10\:05\:10 -0700")
References: <4AA3EBC6.3080306@rodgers.sdcoxmail.com>
Message-ID: <877hwbmi5k.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephen" == Stephen Rodgers <hwstar@rodgers.sdcoxmail.com> writes:

 Stephen> Hi all,

 Stephen> I'm having trouble getting coreutils to build correctly. I'm
 Stephen> using the buildroot tarball buildroot-2009.08.tar.gz, and I
 Stephen> want to build an X86 uclibc development system. At first, I
 Stephen> thought that this issue was resolved through changes to the
 Stephen> coreutils patch file submitted on 7/31, but those changes are
 Stephen> incorporated in the distribution tarball, so there must be
 Stephen> something else going on. Here's the output from the failed
 Stephen> build:

 Stephen> rename.c:33:21: error: windows.h: No such file or directory

windows.h? That's strange. I just did a build for i686 and that works
without any problems - Please post your .config.

On what arch/OS/distribution are you building on?

-- 
Bye, Peter Korsgaard
