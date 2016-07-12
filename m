From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 12 Jul 2016 22:16:14 +0200
Subject: [Buildroot] [PATCH 00/12 v8] Introduce libudev (branch
	yem/libudev-4)
References: <cover.1468274498.git.yann.morin.1998@free.fr>
Message-ID: <XnsA643E28C98875ID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Hi Yann,

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:cover.1468274498.git.yann.morin.1998 at free.fr:

> Not all packages that reference udev have been switched over to depend
> on libudev, though, since it is unclear to me whether they require a
> udev daemon, or would be happy with just libudev. This can be done in
> follow up patches once libudev is eventually in the tree (for good this
> time I hope! ;-) )

great to see the libudev patch series revived :)

I included your patch series in my buildroot repo and added four patches
for libdrm, mesa3d, kodi and libcec, they do not need a udev daemon

https://github.com/bkuhls/buildroot/commits/libudev

* 4cb2069 - package/libdrm: optionally use libudev
* de1f466 - package/mesa3d: optionally use libudev
* 360d492 - package/kodi: libcec support only needs libudev, not udev daemon
* a6c4a70 - package/libcec: optionally use libudev

Feel free to pick them up to your patch series if you like.

On my kodi17 branch you will find the patches from the libudev branch as well
https://github.com/bkuhls/buildroot/commits/kodi17

Regards, Bernd
