From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 23:31:32 +0200
Subject: [Buildroot] [PATCH v2] package/mraa: bump to version 2.1.0
In-Reply-To: <20200607140539.1497-1-yegorslists@googlemail.com>
References: <20200607140539.1497-1-yegorslists@googlemail.com>
Message-ID: <20200610233132.5d7d4eaf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  7 Jun 2020 16:05:39 +0200
yegorslists at googlemail.com wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Change the upstream URL as the project is now under Eclipse umbrella.
> 
> Remove obsolete options like IPK nad RPM and disable JSONPLAT option
> that is enabled by default but requires c-json package.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes v1 -> v2:
> 	- fix COPYING checksum

Forgot about this: when the COPYING hash is changed, we want an
explanation in the commit log. Here is the diff is just:

-Copyright ? 2014 Intel Corporation
+The MIT License (MIT)
+Copyright ? 2014-2019 Intel Corporation and others

So a simple explanation in the commit log would have give some clarity
as to why the COPYING hash has changed.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
