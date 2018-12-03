From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 13:28:44 +0100
Subject: [Buildroot] [PATCH next] tpm2-abrmd: fix build without stack
 smashing protection (SSP)
In-Reply-To: <20181121174337.341-1-casantos@datacom.com.br>
References: <20181121174337.341-1-casantos@datacom.com.br>
Message-ID: <20181203132844.6b55e17c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Nov 2018 15:43:37 -0200, Carlos Santos wrote:
> The configuration environment setup that disables SSP if the toolchain
> does not support it must be updated after the bump to version 2.0.3.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/bd9005eeb24678aa530179a80bbc99b2176f8559
>   http://autobuild.buildroot.net/results/feff61dcb481a94f5f030117830984c5e09727ea
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
>  package/tpm2-abrmd/tpm2-abrmd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
