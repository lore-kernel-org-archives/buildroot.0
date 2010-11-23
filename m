From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Nov 2010 20:33:27 +0100
Subject: [Buildroot] [PATCH] linux: set a few more initramfs opts for
 newer kernels
In-Reply-To: <1290224285-21053-1-git-send-email-vapier@gentoo.org>
References: <1290224285-21053-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101123203327.78a6d842@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 19 Nov 2010 22:38:05 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> Building with linux-2.6.36 and initramfs support causes the build to
> pause while it prompts for newer options (uid/gid/compression).  So
> have the build system inject the newer options into the linux config
> automatically.  Older versions should just ignore these.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Peter, this should go in 2010.11.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
