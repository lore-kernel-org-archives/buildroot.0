From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 20:55:53 +1300
Subject: [Buildroot] [PATCH v2 2/3] package/x11r7/xserver_xorg-server:
 Fix build with wayland, part II
In-Reply-To: <20161227150008.3277-2-bernd.kuhls@t-online.de>
References: <20161227150008.3277-1-bernd.kuhls@t-online.de>
 <20161227150008.3277-2-bernd.kuhls@t-online.de>
Message-ID: <20170128205553.6a8dcee1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Dec 2016 16:00:07 +0100, Bernd Kuhls wrote:
> The previous patch is not sufficient to fix a build with wayland
> support based on
> http://autobuild.buildroot.net/results/cf0/cf026e9b18e86b9890341612050f4d166a7b822d/
> 
> The build still errors out at a later stage during configure:
> 
> configure: error: Xwayland requires CLOCK_MONOTONIC support.
> 
> Add a patch from OpenEmbedded to fix the problem.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: no changes

Applied to master, with a reworked commit title/log, and tweaked
because the X.org server version has been updated in the mean time.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
