From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Thu, 27 Feb 2014 17:11:00 -0700
Subject: [Buildroot] Qt5 and gpu-viv-bin-mx6q problem
In-Reply-To: <CACP2RPYKf_dVKkiHVsqM4vA-Ox69h0C_Nvt33Q-e5uGP6xDorA@mail.gmail.com>
References: <CACP2RPYKf_dVKkiHVsqM4vA-Ox69h0C_Nvt33Q-e5uGP6xDorA@mail.gmail.com>
Message-ID: <530FD414.10003@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Massimiliano,

On 02/27/2014 02:40 PM, Massimiliano Marretta wrote:
> Can I use the gpu-viv-bin-mx6q-3.5.7-1.0.0-hfp.bin with the kernel
> version 3.0.35  ?
>

Unfortunately, saying "3.0.35" isn't specific enough. The first
few releases (what Freescale referred to as 1.0.0, 1.1.0, and 4.0.0)
won't support the badly-named 3.5.7-1.0.0 GPU binaries.

For that, you need the updates that came with the 3.0.35_4.1.0
release.

Clear, huh?

If you have a commit id in your source tree for the last Freescale
update we (or you) can likely pin-point it with "git branch --contains".

If you started with one of the older branches, it's likely that
your patches will forward-port pretty easily. None of the 3.0.35
releases from Freescale had any major re-structuring.

Regards,


Eric
