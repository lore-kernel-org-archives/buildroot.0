From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Nov 2010 16:09:52 +0100
Subject: [Buildroot] [PATCH] initramfs: fix symlink test
In-Reply-To: <1289919526-2227-1-git-send-email-vapier@gentoo.org>
References: <1289919526-2227-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101116160952.34c62a20@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Nov 2010 09:58:46 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> We want to see if the symlink exists which means -L, not if the target
> of the symlink exists.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
