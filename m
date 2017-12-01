From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 09:52:57 +0100
Subject: [Buildroot] [PATCH] uboot-tools: fix dtc invocation
In-Reply-To: <20171201073027.23072-1-yegorslists@googlemail.com>
References: <20171201073027.23072-1-yegorslists@googlemail.com>
Message-ID: <20171201095257.0db57c88@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Dec 2017 08:30:27 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> In Buildroot we don't perform Kconfig configuration for
> u-boot-tools, hence CONFIG_MKIMAGE_DTC_PATH is empty.

Should we do a Kconfig configuration ?

Or alternatively, can we pass CONFIG_MKIMAGE_DTC_PATH=dtc on the build
command line ?

Also: is this broken in master ? In next ? What is this fixing ? (Note:
I know all of this because we discussed it on IRC, but it should be in
the commit log).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
