From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 15 Jan 2008 23:59:18 +0100
Subject: [Buildroot] Buildroot for AT91SAM9260ek ???
References: <068f01c85628$d55a5493$85f0af0a@corp.atmel.com>
	<!&!AAAAAAAAAAAYAAAAAAAAAHPNBStbvZ9BluURSOZ8EsPCgAAAEAAAAI5pkxmidMNBgS9NNLRpTSUBAAAAAA==@freenet.de>
Message-ID: <023e01c857d2$c7f044a0$0b0514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Mr. Samuelsson,

first question:
------------------
Could you explain me why it?s not possible, I don?t understand because there
are binaries from AT91Bootstrap and UBOOT which are loadable from NAND Flash
at the starting process ???(For example from the firm TIMESYS)
So why no NAND Flash only system, when does the error happen ?

==>  It is a bug in the bootROM.

second question:
------------------
In the Buildroot menuconfig I try to add a patch to the 2.6.23 Kernel. I
want to download the 2.6.23-at91.patch.gz from
http://maxim.org.za/AT91RM9200/2.6/2.6.23-at91.patch.gz

But if I type make source the patch isn?t downloaded ?

What do I have to set, to download and apply this patch ?

==> This part needs some extra work,
        Download manually and put in $(DL_DIR)



Best Regards
Ulf Samuelsson 
