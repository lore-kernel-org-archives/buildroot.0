From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 5 Mar 2008 21:07:06 +0100
Subject: [Buildroot] Buildroot on Kwikbyte KBAT9261
References: <6090c5eb0803051137xd753f7ax3db33d595f037e96@mail.gmail.com>
Message-ID: <036c01c87f00$dc470ab0$0c0514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Dear all,
> 
> I've just ordered one KBAT9261 from kwikbyte, wich is AT91SAM9261 based, i'm
> just planning to build a custom board based on the AT91SAM9261 and use it as
> an HMI.
> 
> Somebody here tested buildroot on an AT91SAM9261? 

There is support for the AT91SAM9261EK, but it is less tested than the SAM9260/63.
Don't know the H/W of the KBAT9261, but if it has a dataflash then you should
probably be OK.
There is very little support in Buildroot for AT91 with parallel flash.


> Does it works to build any kind of Xserver?

X is not well supported in Buildroot.
Three versions, but I have not succeeded in building any of them.

> Any library available on buildroot to use on my graphical applications?
> 

DirectFB ?`

> Thanks in advance for your time.
> 
> Regards,
> 
> Jorge.
>


Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57
