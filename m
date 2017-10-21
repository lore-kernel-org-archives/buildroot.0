From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 17:59:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/openjpeg: bump version to 2.3.0
In-Reply-To: <20171015202717.22211-1-bernd.kuhls@t-online.de>
References: <20171015202717.22211-1-bernd.kuhls@t-online.de>
Message-ID: <20171021175958.56a34929@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 15 Oct 2017 22:27:17 +0200, Bernd Kuhls wrote:
> Removed patch 0003, applied upstream:
> https://github.com/uclouvain/openjpeg/commit/51a1dcaa6ed5713520dca36fc58cd9240c08b7ca
> 
> Renamed patch 0004.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I'm not sure if it's caused by this patch, but there are some
gstreamer/openjpeg issues:

  http://autobuild.buildroot.net/results/884/884956af56f63b2634a1984f5ea416075ed87bc8/build-end.log

Could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
