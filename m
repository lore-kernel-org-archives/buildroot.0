From: Robert Nelson <robert.nelson.work@gmail.com>
Date: Thu, 29 May 2008 17:15:32 -0500
Subject: [Buildroot] Atmel AVR32 buildroot branch
In-Reply-To: <483F1FC7.5030600@tait.co.nz>
References: <483F1FC7.5030600@tait.co.nz>
Message-ID: <483F2B04.7080709@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robin Gilks wrote:
> Where do I raise issues with the Atmel AVR32 branch of buildroot? I 
> can't find a relevant mailing list/forum...
>   
There is an Atmel AVR32 Buildroot Mailing list listed here along with 
U-boot and Kernel mailing lists:
http://avr32linux.org/twiki/bin/view/Main/MailingLists

> If what I'm seeing is common to the main trunk perhaps someone could 
> assist here...
>
> u-boot builds all the tools with the cross compiler - not very useful 
> where mkimage is concerned. I eventually sorted it out manually but the 
> u-boot makefile assumes all sorts of things being set in the 
> environment/passed to it that it was a major PITA - it also of course 
> interrupts the flow so that the kernel build fails as it doesn't get 
> built with a u-image wrapper.
>
>   

--
Robert Nelson
FAE - Digi-Key
