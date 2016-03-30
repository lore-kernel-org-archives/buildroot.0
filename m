From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 21:19:16 +0200
Subject: [Buildroot] [PATCH] cannelloni: new package
In-Reply-To: <1457006507-26443-1-git-send-email-yegorslists@googlemail.com>
References: <1457006507-26443-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160330211916.29518b3d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 Mar 2016 13:01:47 +0100, yegorslists at googlemail.com wrote:

> +CANNELLONI_VERSION = v0.5
> +CANNELLONI_SITE = $(call github,mguentner,cannelloni,$(CANNELLONI_VERSION))
> +CANNELLONI_LICENSE = GPLv2+

According to the source files, the license is GPLv2 and not GPLv2+.
I've fixed that up and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
