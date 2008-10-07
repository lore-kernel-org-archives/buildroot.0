From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 7 Oct 2008 07:41:28 +0200
Subject: [Buildroot] [BR-AVR32] [PATCH] Support for new MIMC200 board
In-Reply-To: <48EA05EB.7020807@mimc.co.uk>
References: <48EA05EB.7020807@mimc.co.uk>
Message-ID: <20081007074128.12613e2c@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 06 Oct 2008 13:34:51 +0100
Mark Jackson <mpfj@mimc.co.uk> wrote:

> Please consider the following patch which adds support for a new
> AVR32 based board.
> 
> The board is closely based on Atmel's NGW100 reference board, but has
> an extra 8MByte FLASH and 128KByte FRAM.
> 
> The compressed patch is 66k, so I've stuck it on our website.
> 
> http://www.mimc.co.uk/mimc200-new-board.patch.bz2
> 

Could you post it in plain text attachment/inline instead? It is a bit
hard to comment on a compressed patch file ;)

Is the patch based on the latest uclibc.org repo or Buildroot for AVR32
release (v2.2.0)?

-- 
Best regards,
Hans-Christian Egtvedt
