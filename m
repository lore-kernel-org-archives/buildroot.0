From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Apr 2010 23:07:40 +0200
Subject: [Buildroot] [PATCH] Repair initramfs dependancies after move to
 fs
In-Reply-To: <1271687689-344-1-git-send-email-will_wagner@carallon.com>
References: <1271687689-344-1-git-send-email-will_wagner@carallon.com>
Message-ID: <20100419230740.267afdad@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 19 Apr 2010 15:34:49 +0100
Will Wagner <will_wagner@carallon.com> wrote:

> The restructure for building root filesystems changed the target name
> for the initramfs file, to build the file the trget is now
> initramfs-root but the generated file is rootfs.initramfs
> 
> Signed-off-by: Will Wagner <will_wagner@carallon.com>

I'm not a big fan of this "hidden" dependencies, but I believe in the
case of the kernel and its initramfs there isn't a lot of choice.
Therefore:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
