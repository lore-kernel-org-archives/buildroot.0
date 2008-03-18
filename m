From: Habib Bouaziz-Viallet <habib.bouaziz@gmail.com>
Date: Tue, 18 Mar 2008 11:44:09 +0100
Subject: [Buildroot] Thumb support in kernel config
Message-ID: <d449ded70803180344re1a0f17i347e8412943b86a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all !

I have just realize that there is 'Thumb' support in within Linux kernel


  ARM system type (Atmel AT91)  --->
*** Boot options ***
*** Power management ***
Atmel AT91 System-on-Chip  --->
*** Processor Type ***
[*] Support ARM926T processor
*** Processor Features ***
[*] Support Thumb user binaries

My question :

What is involved in this option? The kernel itself, or user-land applications ?

Best regards

--
M. Bouaziz-Viallet H
