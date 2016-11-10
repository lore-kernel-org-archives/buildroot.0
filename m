From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Nov 2016 11:17:55 +0100
Subject: [Buildroot] [PATCH v2] configs: atmel: sama5d4ek removal
In-Reply-To: <20161110101439.27671-1-ludovic.desroches@atmel.com>
References: <20161110095409.y25d3vkzeebozw2j@tarshish>
 <20161110101439.27671-1-ludovic.desroches@atmel.com>
Message-ID: <20161110111755.4544331a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Nov 2016 11:14:39 +0100, Ludovic Desroches wrote:
> The Atmel sama5d4ek board is no longer sold. Since there is the Xplained
> board and we won't maintain anymore the EK board, the defconfig can be
> removed.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> ---

I had already applied the removal patch, so this one couldn't apply
as-is. I fixed it up so that it applies, and adjusted the commit log
accordingly. Applied to master!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
