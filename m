From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 14:30:38 +0100
Subject: [Buildroot] [PATCH] package/systemd: drop optiopns that are now
 conditional
In-Reply-To: <20190317130732.10994-1-yann.morin.1998@free.fr>
References: <20190317130732.10994-1-yann.morin.1998@free.fr>
Message-ID: <20190317143038.3c6b5a8b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Mar 2019 14:07:32 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Commit 6f28ce53222 (package/systemd: enable building of systemd-boot)
> made the efi and gnu-efi optiona conditional upon whether systemd-boot
> is built or not, but forgot to remove the non-conditional ones.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/systemd/systemd.mk | 2 --
>  1 file changed, 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
