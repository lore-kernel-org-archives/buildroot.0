From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Nov 2016 11:06:03 +0100
Subject: [Buildroot] [PATCH] configs: atmel: sama5d4ek removal
In-Reply-To: <20161110084927.13293-1-ludovic.desroches@atmel.com>
References: <20161110084927.13293-1-ludovic.desroches@atmel.com>
Message-ID: <20161110110603.7bb8edeb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Nov 2016 09:49:27 +0100, Ludovic Desroches wrote:
> The Atmel sama5d4ek board is no longer sold. Since there is the Xplained
> board and we won't maintain anymore the EK board, the defconfig can be
> removed.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> ---
>  configs/atmel_sama5d4ek_defconfig | 30 ------------------------------
>  1 file changed, 30 deletions(-)
>  delete mode 100644 configs/atmel_sama5d4ek_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
