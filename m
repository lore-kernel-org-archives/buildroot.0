From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 09:04:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/lldpd: bump version to 0.9.7
In-Reply-To: <20170730163258.28200-1-bernd.kuhls@t-online.de>
References: <20170730163258.28200-1-bernd.kuhls@t-online.de>
Message-ID: <20170731090434.268838b6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Jul 2017 18:32:58 +0200, Bernd Kuhls wrote:
> Switched _SITE to https.
> 
> Removed 0001-build-make-generation-of-atom-glue-compatible-with-o.patch,
> applied upstream:
> https://github.com/vincentbernat/lldpd/commit/106aa50d4e5b336f7dd2d5cf4d882e692d205e91
> 
> Removed 0002-configure-do-not-check-for-libbsd.patch, included in
> https://github.com/vincentbernat/lldpd/commit/cbe8bbd6b60fdc0fa83ddb10d2f771ed26810304

This is not the same patch at all. Yann's patch was removing libbsd
support entirely, while this patch adjusts how libbsd is detected.

Have you tested building lldpd in a configuration with libbsd enabled,
and made sure that libbsd was built before lldpd ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
