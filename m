From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 15:32:30 +0200
Subject: [Buildroot] [PATCH v3] mc: new package
In-Reply-To: <1427227067-3514-1-git-send-email-yegorslists@googlemail.com>
References: <1427227067-3514-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20150329153230.166bc880@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Tue, 24 Mar 2015 20:57:47 +0100, Yegor Yefremov wrote:

> +MC_VERSION = 4.8.14
> +MC_SOURCE = mc-$(MC_VERSION).tar.bz2
> +MC_SITE = http://ftp.midnight-commander.org
> +MC_LICENSE =  GPLv3

License is GPLv3+, not GPLv3.

Patch applied with this fixed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
