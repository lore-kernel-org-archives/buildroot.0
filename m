From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 20:10:51 +0200
Subject: [Buildroot] [PATCH 1/3] package/x11r7/xserver_xorg-server: fix
 optional glx dependency
In-Reply-To: <20191023062220.5646-1-bernd.kuhls@t-online.de>
References: <20191023062220.5646-1-bernd.kuhls@t-online.de>
Message-ID: <20191025201051.208685c5@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Oct 2019 08:22:18 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Typo was added by commit
> https://git.buildroot.net/buildroot/commit/?id=c2856aa2857d616788684a053f1c886da00d977f
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
