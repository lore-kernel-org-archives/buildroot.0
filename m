From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 08:52:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/openjdk: remove mips support
In-Reply-To: <20190415211428.25961-1-aduskett@gmail.com>
References: <20190415211428.25961-1-aduskett@gmail.com>
Message-ID: <20190417085245.30b47d97@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Apr 2019 17:14:27 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> The mips-port project has been abandoned for some time.
> https://mail.openjdk.java.net/pipermail/mips-port/2018-August/000082.html
> 
> Fixes:
> http://autobuild.buildroot.net/results/1059026c9b5f503684fe1589cd43d25a8484290b/build-end.log

We typically use just
http://autobuild.buildroot.net/results/1059026c9b5f503684fe1589cd43d25a8484290b/,
not the URL to the build log specifically.

Also, an empty line before the SoB line was missing.

I fixed both nits and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
