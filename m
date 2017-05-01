From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 May 2017 10:43:44 +0200
Subject: [Buildroot] [PATCH 1/3] board: add stm32f429-disc1 config
In-Reply-To: <20170501072645.5571-1-s.martin49@gmail.com>
References: <20170501072645.5571-1-s.martin49@gmail.com>
Message-ID: <20170501104344.457114c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 May 2017 09:26:43 +0200, Samuel Martin wrote:
> This change renders the stm32f429discovery a bit more generic and reuse most
> of its settings for the stm32f429-disc1 board.
> 
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> Cc: Davide Viti <d.viti@infosolution.it>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  board/stmicroelectronics/stm32f429-disc1            |  1 +
>  board/stmicroelectronics/stm32f429-disco/flash.sh   | 10 ++++++++--
>  board/stmicroelectronics/stm32f429-disco/readme.txt |  7 ++++---
>  3 files changed, 13 insertions(+), 5 deletions(-)
>  create mode 120000 board/stmicroelectronics/stm32f429-disc1

So there's no new defconfig? The existing one works fine, and the board
only differs in the wiring of the serial port and the JTAG connection ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
