From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 21:31:21 +0200
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: fix the
 target in systemd service
In-Reply-To: <20200907161755.1457941-1-francois.perrad@gadz.org>
References: <20200907161755.1457941-1-francois.perrad@gadz.org>
Message-ID: <20200907213121.160e7441@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  7 Sep 2020 18:17:55 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> graphical is equivalent to the sysvinit runlevel 5
> multi-user is equivalent to a runlevel between 2 and 4
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/x11r7/xserver_xorg-server/xorg.service | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
