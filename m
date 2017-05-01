From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 May 2017 11:49:20 +0200
Subject: [Buildroot] [PATCH v2 1/2] board: add stm32f429-disc1 config
In-Reply-To: <20170501091622.1930-1-s.martin49@gmail.com>
References: <20170501091622.1930-1-s.martin49@gmail.com>
Message-ID: <20170501114920.43c7d757@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 May 2017 11:16:21 +0200, Samuel Martin wrote:

>  board/stmicroelectronics/stm32f429-disc1            |  1 +

Does it really make sense to create a symbolic link ?

> --- a/board/stmicroelectronics/stm32f429-disco/readme.txt
> +++ b/board/stmicroelectronics/stm32f429-disco/readme.txt
> @@ -15,8 +15,8 @@ Wire the UART
>  

The beginning of this document should be updated to mention that it
supports both platform, through the same defconfig.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
