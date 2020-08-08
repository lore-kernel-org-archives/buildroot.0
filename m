From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 18:20:38 +0200
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: add
 systemd init
In-Reply-To: <20200731151451.3169915-1-francois.perrad@gadz.org>
References: <20200731151451.3169915-1-francois.perrad@gadz.org>
Message-ID: <20200808182038.6eb836cf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 Jul 2020 17:14:50 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> run with same options as in S40xorg
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/x11r7/xserver_xorg-server/xorg.service        | 11 +++++++++++
>  .../x11r7/xserver_xorg-server/xserver_xorg-server.mk  |  5 +++++
>  2 files changed, 16 insertions(+)
>  create mode 100644 package/x11r7/xserver_xorg-server/xorg.service

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
