From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:10:24 +0100
Subject: [Buildroot] [PATCH] package/imx-lib: fix legal-info
In-Reply-To: <1453664245-20137-1-git-send-email-yann.morin.1998@free.fr>
References: <1453664245-20137-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160125231024.04704101@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 24 Jan 2016 20:37:25 +0100, Yann E. MORIN wrote:
> The new version of imx-lib no longer bears the EULA file, and has no
> other license file.
> 
> So, we pick a small header as the license file.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/freescale-imx/imx-lib/imx-lib.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
