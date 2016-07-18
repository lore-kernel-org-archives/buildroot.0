From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 23:10:42 +0200
Subject: [Buildroot] [PATCH v3 1/3] package/mesa3d: add optional support
 for libsha1
In-Reply-To: <1468772875-5090-1-git-send-email-bernd.kuhls@t-online.de>
References: <1468772875-5090-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160718231042.178b966e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 18:27:53 +0200, Bernd Kuhls wrote:
> mesa3d supports several sha1 implementations:
> https://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=12.0#n1167
> 
> This patch adds support for libsha1, inspired by the
> xserver_xorg-server package:
> https://github.com/buildroot/buildroot/blob/master/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk#L247
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: no changes
> v2: never released, jumped from v1 to v3

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
