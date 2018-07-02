From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 2 Jul 2018 21:16:35 +0200
Subject: [Buildroot] Building the Rockchip libv4l plugin
In-Reply-To: <20180702082211.bwi2ynnjnfzx3mhm@tarshish>
References: <20180702082211.bwi2ynnjnfzx3mhm@tarshish>
Message-ID: <20180702211635.6d55d14a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Mon, 2 Jul 2018 11:22:11 +0300, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Buildroot list,
> 
> I'm trying to build the Rockchip libv4l2 plugin in Buildroot. The source is at
> 
>   https://chromium.googlesource.com/chromiumos/third_party/libv4lplugins/+/master/libv4l-rockchip_v2/
> 
> As upstream indicated[1], the code is meant to build as part of libv4l, not as 
> a standalone library. ChromiumOS sees to copy the code into the libv4l source 
> tree, and modify the relevant build configuration files[2].
> 
> What would be the best way to do that in Buildroot? A symlink to the plugin 
> source tree? Copy of the code to libv4l?

...or add a configure.ac/configure file to the source?

Regards,
Peter

> 
> Is there any other package doing something similar?
> 
> Thanks,
> baruch
> 
> [1] http://lists.infradead.org/pipermail/linux-rockchip/2018-July/021107.html
> 
> [2] https://chromium.googlesource.com/chromiumos/overlays/chromiumos-overlay/+/master/media-libs/libv4lplugins/libv4lplugins-9999.ebuild
> 
