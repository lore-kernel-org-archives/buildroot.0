From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 22:22:46 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/mplayer: Fix linking with
 libvorbis/libdvdread
In-Reply-To: <1446998117-14021-1-git-send-email-bernd.kuhls@t-online.de>
References: <1446998117-14021-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151118222246.7c3e1158@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun,  8 Nov 2015 16:55:17 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/7f6/7f6e5396e95a3c3b676ca59bedc5317aa88e5f4c/
> http://autobuild.buildroot.net/results/6ac/6acd9cf25c3088d313247510db47a214fff30c67/
> http://autobuild.buildroot.net/results/a0d/a0da41bb734dbcdb17e13d852cfbdba5e069429e/
> http://autobuild.buildroot.net/results/d0c/d0caf60c1ddf4e05086c93f646e32b5ddc75b6ce/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: adjust mplayer.mk to match mplayer/configure behaviour
>     by fixing libdvdread and libvorbis support (Thomas)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
