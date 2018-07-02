From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 2 Jul 2018 11:22:11 +0300
Subject: [Buildroot] Building the Rockchip libv4l plugin
Message-ID: <20180702082211.bwi2ynnjnfzx3mhm@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot list,

I'm trying to build the Rockchip libv4l2 plugin in Buildroot. The source is at

  https://chromium.googlesource.com/chromiumos/third_party/libv4lplugins/+/master/libv4l-rockchip_v2/

As upstream indicated[1], the code is meant to build as part of libv4l, not as 
a standalone library. ChromiumOS sees to copy the code into the libv4l source 
tree, and modify the relevant build configuration files[2].

What would be the best way to do that in Buildroot? A symlink to the plugin 
source tree? Copy of the code to libv4l?

Is there any other package doing something similar?

Thanks,
baruch

[1] http://lists.infradead.org/pipermail/linux-rockchip/2018-July/021107.html

[2] https://chromium.googlesource.com/chromiumos/overlays/chromiumos-overlay/+/master/media-libs/libv4lplugins/libv4lplugins-9999.ebuild

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
