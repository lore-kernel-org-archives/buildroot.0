From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Nov 2010 11:46:11 +0100
Subject: [Buildroot] [PATCH] linux: add shorter shortcuts
In-Reply-To: <1290075883-30494-1-git-send-email-vapier@gentoo.org>
References: <1290075883-30494-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101118114611.70f3c219@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Nov 2010 05:24:43 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> We only have one Linux kernel package, and "linux26-" is an
> anachronism in today's world.  So add useful "linux-%" shortcuts to
> the "linux26-%".
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Could you please update the documentation at the same time ? This way,
we could get rid of the linux26-% targets in next releases.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
