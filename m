From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Sep 2020 21:23:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: fix
 segfault on brcm platforms
In-Reply-To: <20200922002916.3621404-1-joseph.kogut@gmail.com>
References: <20200922002916.3621404-1-joseph.kogut@gmail.com>
Message-ID: <20200922212328.1f9ad48d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Sep 2020 17:29:16 -0700
Joseph Kogut <joseph.kogut@gmail.com> wrote:

> According to the original patch message:
>     Some Broadcom set-top-box boards have PCI busses, but the GPU is
>     still probed through DT.  We would dereference a null busid here
>     in that case.
> 
> Fixes a segfault on at least the RPi 4 w/ xserver 1.20.9, probably
> others as well.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
