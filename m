From: Michael S. Zick <minimod@morethan.org>
Date: Tue, 15 Jun 2010 07:46:52 -0500
Subject: [Buildroot] Fwd: Ask for support.(buildroot).
In-Reply-To: <AANLkTimzO7bNdt1MhPAi6jOtcZx2t_-wTZFhCahu-ZEo@mail.gmail.com>
References: <AANLkTilc3EONIH7kWw5eX9TLAcaSSSVbyDCTiFdeAl7Y@mail.gmail.com>
	<AANLkTimzO7bNdt1MhPAi6jOtcZx2t_-wTZFhCahu-ZEo@mail.gmail.com>
Message-ID: <201006150746.55087.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue June 15 2010, Ahmed Soliman wrote:
> Dear Sir,
> 
> THIS IS MY PROBLEM ,
> 
> I dont know what i have to select and configure in the menu config of
> bulidroot  TO  build my linux
> 
> I am buliding this embedded linux to work on this device spec.
> 
> VIA Eden Esther 1.2 GHz processor
> AMI BIOS
> SYSTEM CHIPST VIA CX700M
> i/o chip  Winbond W83697
> MEMORY 1GB DDR2
>

Just pretend it is an x86 processor system with a couple
of exceptions on the kernel menu config where you select
the VIA processor (or not, it will run as an x86)

Your:
ARCH=x86 <bb command>
should otherwise do the job.

Mike
> 
> I NEED TO BOOT IT UP FROM COMPACT FLASH.
> 
> 
> THANKS
> Please help...
> 
> 
> Eng . AHmed Badr
> 
