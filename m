From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Apr 2015 17:22:49 +0200
Subject: [Buildroot] [PATCH] android-tools: new host package
In-Reply-To: <1430142448-9390-1-git-send-email-antoine.tenart@free-electrons.com>
References: <1430142448-9390-1-git-send-email-antoine.tenart@free-electrons.com>
Message-ID: <20150427172249.74dbb30c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Antoine,

Yes, I know the patch comes from me, but there are some typos.

On Mon, 27 Apr 2015 15:47:28 +0200, Antoine Tenart wrote:
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> This host package allows to build the fastboot and adb utilities,
> which can be used to interfact with target devices implementing one of

interfact -> interact

> +config BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB
> +       bool "adb"
> +       help
> +         This option will build and install the adb utility for the
> +         host, which can be used to interfact with target devices

interfact -> interact

Also, I forgot to add a hash file. Make sure to add the hash for both
the tarball itself, and the Debian tarball as well.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
