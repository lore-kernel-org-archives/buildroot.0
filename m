From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 21:24:48 +0100
Subject: [Buildroot] [PATCHv2] configs/aarch64_efi: needs
 host-{dosfstools, mtools}
In-Reply-To: <20181209170726.11543-1-yann.morin.1998@free.fr>
References: <20181209170726.11543-1-yann.morin.1998@free.fr>
Message-ID: <20181209212448.446c933b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Dec 2018 18:07:26 +0100, Yann E. MORIN wrote:
> Fixes:
>     https://gitlab.com/ymorin/buildroot/-/jobs/131924126
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Erico Nunes <nunes.erico@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> ---
> Changes v1 -> v2:
>   - add mtools too  (Thomas)
> ---
>  configs/aarch64_efi_defconfig | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
