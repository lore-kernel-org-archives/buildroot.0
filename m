From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Dec 2010 20:23:31 +0100
Subject: [Buildroot] [PATCH] linux: restore DEPMOD usage
In-Reply-To: <1291800426-28554-1-git-send-email-vapier@gentoo.org>
References: <1291800426-28554-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101208202331.3bf47461@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  8 Dec 2010 04:27:06 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> The linux.mk rewrite lost the DEPMOD setting while installing modules
> which means depending on host-module-init-tools has been useless.
> Instead, the build system has been executing /sbin/depmod.
> 
> While we're here, drop the INSTALL_MOD_PATH since LINUX26_MAKE_FLAGS
> already contains it.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
