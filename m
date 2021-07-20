From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 22:11:23 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/linux-firmware: remove
 duplicated entries for brcmfmac4366b-pcie.bin and brcmfmac4366c-pcie.bin
In-Reply-To: <20210706141132.18307-1-ps.report@gmx.net>
References: <20210706141132.18307-1-ps.report@gmx.net>
Message-ID: <20210720221123.5fe68ae8@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue,  6 Jul 2021 16:11:31 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Remove duplicated entries for brcmfmac4366b-pcie.bin and
> brcmfmac4366c-pcie.bin (present since addition with
> commit ca6e3f4b900a2cca605d44cffcc463db432ac0ac)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/linux-firmware/linux-firmware.mk | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
