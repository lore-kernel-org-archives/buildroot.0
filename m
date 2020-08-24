From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Aug 2020 22:56:36 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/nut: install to staging
In-Reply-To: <20200822085643.922674-1-bernd.kuhls@t-online.de>
References: <20200822085643.922674-1-bernd.kuhls@t-online.de>
Message-ID: <20200824225636.57c87e5d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 22 Aug 2020 10:56:42 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Needed for collectd plugin.
> 
> Added --with-dev to enable install of pkgconfig files:
> https://github.com/networkupstools/nut/blob/master/lib/Makefile.am#L3
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/nut/nut.mk | 2 ++
>  1 file changed, 2 insertions(+)

Both applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
