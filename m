From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 8 Sep 2015 18:16:55 +0200
Subject: [Buildroot] Right board to use -- buildroot begniers
In-Reply-To: <CAKpDV8uJiT88YYY2gxNohTmQoP2toaFpWFjDSGTSaG2kENaPCg@mail.gmail.com>
References: <CAKpDV8sGQrmePsmbhrQo0YMGTLLTZb4Rsq90W3Y4nfMZTrcS+A@mail.gmail.com>
 <55EDE7A6.4060902@mind.be>
 <CAKpDV8udG2fRi8RWJbb=5nPNJ3SnYUE6dsPPmD11vnwUFzLL1A@mail.gmail.com>
 <55EE8B90.9060708@mind.be>
 <CAKpDV8uJiT88YYY2gxNohTmQoP2toaFpWFjDSGTSaG2kENaPCg@mail.gmail.com>
Message-ID: <55EF09F7.6040401@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dinesh,

Dinesh Guleria wrote:
> So i will go for atmel_sama5d3_xplained .
> http://www.element14.com/community/docs/DOC-38394/l/evaluation-kit-for-at91sam9g45
>
>  >> I have no idea, but it is fully supported by Buildroot, both for
> booting from
> SD card and booting from flash.
>
> With seggers j- link can i flash uboot to the Nand flash of this board ?

To flash the bootloader on the sama5d3_xplained board you don't need
any JTAG interface. You just need to remove the NAND CS jumper on the
board and connect on UART with the sam-ba tool.

The labs from the Free Electrons training material have detailed
information on how to do that:
http://free-electrons.com/doc/training/embedded-linux/

-- 
Luca	
