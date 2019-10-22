From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 22:59:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/libva: switch to virtual opengl
 provider
In-Reply-To: <20191012153931.24484-1-bernd.kuhls@t-online.de>
References: <20191012153931.24484-1-bernd.kuhls@t-online.de>
Message-ID: <20191022225952.4587b309@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 12 Oct 2019 17:39:31 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> This allows to use libva without mesa3d.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libva/libva.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
