From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 12:01:26 +0200
Subject: [Buildroot] [pull request] package/opencv: re-introduce opencv24
In-Reply-To: <cover.1440420122.git.yann.morin.1998@free.fr>
References: <cover.1440420122.git.yann.morin.1998@free.fr>
Message-ID: <20150825120126.52fecfeb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, 24 Aug 2015 14:47:07 +0200, Yann E. MORIN wrote:

> Samuel Martin (4):
>       package: rename opencv -> opencv3
>       package/opencv: re-introduce opencv for opencv-2.4
>       Revert "package/gstreamer1/gst1-plugins-bad: disable opencv plugin with opencv-3"
>       package/vlc: update opencv support

Series applied to master, so that 2015.08 isn't introducing a
regression in the OpenCV support.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
