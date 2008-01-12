From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 12 Jan 2008 13:52:16 +0100
Subject: [Buildroot] Buildroot for AT91SAM9260ek ???
References: <!&!AAAAAAAAAAAYAAAAAAAAAHPNBStbvZ9BluURSOZ8EsPCgAAAEAAAANwOV1TDEHJNqhX50cqUQ5EBAAAAAA==@freenet.de>
Message-ID: <01b601c85520$dc517720$030514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

 

I?m new in Linux developing, I choose Buildroot to make my Linux Distribution.

 

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
        This is the AT91SAM9260EK running from a dataflash card (AT45DCB008D).

Best Regards
Ulf Samuelsson
