From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 20:52:53 +1300
Subject: [Buildroot] [PATCH v2 1/3] package/x11r7/xserver_xorg-server:
 Fix build with wayland, part I
In-Reply-To: <20161227150008.3277-1-bernd.kuhls@t-online.de>
References: <20161227150008.3277-1-bernd.kuhls@t-online.de>
Message-ID: <20170128205253.143f7e44@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Dec 2016 16:00:06 +0100, Bernd Kuhls wrote:
> Add missing dependency wayland-protocols.
> 
> Partly fixes
> http://autobuild.buildroot.net/results/cf0/cf026e9b18e86b9890341612050f4d166a7b822d/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: added missing 'y' (Gustavo)

Applied to master, with a reworked commit title. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
