From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Aug 2020 15:12:12 +0200
Subject: [Buildroot] [git commit] package/php: drop
 BR2_PACKAGE_PHP_EXT_HASH
In-Reply-To: <20200824083306.GC10811@scaer>
References: <20200823165655.328FB814F6@busybox.osuosl.org>
 <20200823190650.7bc12a8a@windsurf.home>
 <20200824082506.GB10811@scaer> <20200824083306.GC10811@scaer>
Message-ID: <20200824151212.3a87a875@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 24 Aug 2020 10:33:06 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> While doing so, I notice we do have similar now-mandatory options from
> the EFL package, with commit 6deaa3d50de (package/efl: bump to version
> 1.23.2).
> 
> Shall I drop those too?

Indeed, those are not needed, we can drop them. Thanks for noticing!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
