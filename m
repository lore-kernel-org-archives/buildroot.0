From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Dec 2010 22:29:51 +0100
Subject: [Buildroot] [PATCH] toolchain: glibc: improve library checking
In-Reply-To: <1292172985-8647-1-git-send-email-vapier@gentoo.org>
References: <1292172985-8647-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101213222951.3580310f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mike,

On Sun, 12 Dec 2010 11:56:25 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> If the source sysroot has symlinks to the ldso, the globs might match more
> than one file, and test fails due to too many arguments.  So move the glob
> into a for loop and test each result that way.

Here as well, could you give a specific example of a toolchain that
exhibits the problem ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
