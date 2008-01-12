From: Manuel Sahm <ManuelSahm@freenet.de>
Date: Sat, 12 Jan 2008 20:06:57 +0100
Subject: [Buildroot] Buildroot for AT91SAM9260ek ???
In-Reply-To: <01b601c85520$dc517720$030514ac@atmel.com>
References: <!&!AAAAAAAAAAAYAAAAAAAAAHPNBStbvZ9BluURSOZ8EsPCgAAAEAAAANwOV1TDEHJNqhX50cqUQ5EBAAAAAA==@freenet.de>
	<01b601c85520$dc517720$030514ac@atmel.com>
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAHPNBStbvZ9BluURSOZ8EsPCgAAAEAAAAC6dxJ2+zpVGpmg9w9zTIPABAAAAAA==@freenet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Mr. Samuelsson,

but I don?t want to use a DataFlashCard.

I only want to use the NAND flash which is on the Board (AT91SAM9260EK).

In the NAND Flash there should be the AT91Bootstrap, The UBoot Env, the
UBoot and the RootFileSystem...

Is it possible with Buildroot, what do I have to do/choose for this ?

Thank you very very much

Manuel Sahm

-----Urspr?ngliche Nachricht-----
Von: Ulf Samuelsson [mailto:ulf at atmel.com] 
Gesendet: Samstag, 12. Januar 2008 13:52
An: Manuel Sahm; buildroot at uclibc.org
Betreff: Re: [Buildroot] Buildroot for AT91SAM9260ek ???

Hello,

 

I?m new in Linux developing, I choose Buildroot to make my Linux
Distribution.

 

First I got Buildroot from 
$ svn co svn://uclibc.org/trunk/buildroot
then
$ make menuconfig

 

->

I go out with Exit
Then I want to enter:
$ make at91sam9260ek_defconfig

But there is no defconfig for the ek, only for pf and dfc ? 
What do I have to choose ?

Thank you very much
Manuel Sahm

==> Use the at91sam9260dfc.
        This is the AT91SAM9260EK running from a dataflash card
(AT45DCB008D).

Best Regards
Ulf Samuelsson
