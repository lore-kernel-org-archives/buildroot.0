From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 09:43:33 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/network-manager: fix build
 with older kernel headers
In-Reply-To: <1434561130-31199-1-git-send-email-petr.vorel@gmail.com>
References: <1434561130-31199-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <20150621094333.08c71f4e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Petr Vorel,

On Wed, 17 Jun 2015 19:12:10 +0200, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---

With which kernel headers version do you have a problem? The
network-manager package already depends on kernel headers >= 3.7.

> diff --git a/package/network-manager/0002-systemd-dhcp-fix-build-with-Linux-3.2.0-headers.patch b/package/network-manager/0002-systemd-dhcp-fix-build-with-Linux-3.2.0-headers.patch
> new file mode 100644
> index 0000000..a9bdb0e
> --- /dev/null
> +++ b/package/network-manager/0002-systemd-dhcp-fix-build-with-Linux-3.2.0-headers.patch
> @@ -0,0 +1,37 @@
> +From ae4fc67ae6f14c57a4162731089d69d80a7c7d6d Mon Sep 17 00:00:00 2001
> +From: Petr Vorel <petr.vorel@gmail.com>
> +Date: Wed, 17 Jun 2015 18:56:13 +0200
> +Subject: [PATCH] systemd-dhcp: fix build with Linux 3.2.0 headers

This commit is really an upstream commit:

commit 3811a68389b9277533f2eee8372927ca6238653e
Author: Lubomir Rintel <lkundrak@v3.sk>
Date:   Fri May 15 16:38:10 2015 +0200

    systemd-dhcp: fix build with Linux 3.2.0 headers
    
    Fixes build on Ubuntu 12.04.

So the author should be kept as is.

Also, please add your Signed-off-by inside both patches.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
