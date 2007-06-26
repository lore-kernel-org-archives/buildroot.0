From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 26 Jun 2007 08:21:35 +0200
Subject: [Buildroot] Problem building latest arm
In-Reply-To: <6B9D9C36F5A26347A593D6945C470AE90F3FF8@delta-two.prga.net>
References: <6B9D9C36F5A26347A593D6945C470AE90F3FF8@delta-two.prga.net>
Message-ID: <20070626062135.GA4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 25, 2007 at 10:04:44PM -0500, michael.miller at prga.com wrote:
>I'm trying to build for an Xscale (ARM), EABI, NPTL with binutils
>2.17.50.0.16, software floating point, and target options bash, bzip2
>and diffutils.  All other options are default (gcc 4.2.0).  I'm using
>the latest snapshot for uclibc, and have tried buildroot snapshots from
>6/20, 6/21 and 6/23.
>
>If I use 6/20, 6/21 or 6/23 buildroot snapshots then the build fails in
>pthreads because sysdep-cancel.h is not found.  Looking in the
>linuxthreads/sysdeps/unix/sysv/linux directory, I see subdirectories for
>i386, mips, etc. but not for arm.
>
>Searching recent mailing list archives, Bernhard says things that make
>me think this configuration should work.  He hints that helptext will

I was talking about eabi. Threading is a different issue (but even
that one has a nice, IMHO descriptive help-text).
