From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Dec 2010 22:29:03 +0100
Subject: [Buildroot] [PATCH] toolchain-external: improve sysroot lookup
 with multilib
In-Reply-To: <1292171125-32589-1-git-send-email-vapier@gentoo.org>
References: <1292171125-32589-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101213222903.2232b63f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Dec 2010 11:25:25 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> If the external toolchain we're using starts in a path other than /usr/lib,
> the sysroot detection fails as it has /usr/lib hardcoded.  Improve the code
> to strip out any lib suffixes to handle the most common behavior.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Could you point me to a specific toolchain for which the problem is
occuring ? Just to make it clear: I do believe that the problem exists
and that the patch is useful in that case, I just want to be sure to
understand it completely, and potentially add a new test case to my
testing stuff.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
