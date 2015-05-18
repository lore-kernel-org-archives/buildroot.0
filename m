From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 May 2015 23:09:23 +0200
Subject: [Buildroot] [PATCH v2 4/9] configs: add defconfig for Atmel
 sama5d3xek
In-Reply-To: <1431544977-2274-5-git-send-email-alexandre.belloni@free-electrons.com>
References: <1431544977-2274-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1431544977-2274-5-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <20150518230923.51541ce3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexandre Belloni,

On Wed, 13 May 2015 21:22:52 +0200, Alexandre Belloni wrote:

> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sama5d31ek sama5d31ek_pda4 sama5d31ek_pda7 sama5d31ek_revc sama5d31ek_revc_pda4 sama5d31ek_revc_pda7 sama5d33ek sama5d33ek_pda4 sama5d33ek_pda7 sama5d33ek_revc sama5d33ek_revc_pda4 sama5d33ek_revc_pda7 sama5d34ek sama5d34ek_pda4 sama5d34ek_pda7 sama5d34ek_revc sama5d34ek_revc_pda4 sama5d34ek_revc_pda7 sama5d35ek sama5d35ek_revc sama5d36ek sama5d36ek_pda4 sama5d36ek_pda7 sama5d36ek_revc sama5d36ek_revc_pda4 sama5d36ek_revc_pda7"

Hum, at some point we'll have to think about using $(wildcard ...) or
something like that to allow wildcards in this option. But since
there's only one user for now, and it's not very common to have
gazillions of DTs for a given board, it's probably not worth the effort.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
