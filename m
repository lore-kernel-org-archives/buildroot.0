From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Aug 2019 22:39:48 +0200
Subject: [Buildroot] [PATCH 1/2] package/mpd: soundcloud feature
 requires curl
In-Reply-To: <20190809200545.10188-1-joerg.krause@embedded.rocks>
References: <20190809200545.10188-1-joerg.krause@embedded.rocks>
Message-ID: <20190809223948.4eec91bb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  9 Aug 2019 22:05:44 +0200
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> MPD switched from the Autotools to the Meson build system. The Autotools
> configure did not check for curl when enabling the Soundcloud feature, but the
> Meson configuration script does.
> 
> Fixes:
> http://autobuild.buildroot.org/results/eef/eefe8c6816d9504e8997483abcf7b1327260409c
> http://autobuild.buildroot.org/results/95d/95d3a9ee41b0f68f59c1f6b35fb35506f53e3bb9
> http://autobuild.buildroot.org/results/dd5/dd5083bacd4fc00f0a1b9d47569943434cc5a5ec
> http://autobuild.buildroot.org/results/bea/bea73f76ce8056411499cf5c7daf70a26e182226
> .. and more.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/mpd/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Thanks, but Fabrice sent exactly identical patches a few hours earlier,
so I'm applying Fabrice patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
