From: Foxtrot Mike <fulcrummike@hotmail.com>
Date: Sat, 16 Dec 2017 18:20:35 +0000
Subject: [Buildroot] Getting started with embedded Linux on a router
Message-ID: <PS1PR0401MB19616F5D660E5EEFD60CFCB3B3080@PS1PR0401MB1961.apcprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have been using Linux for around 5 years. I also play around with RPI
from time to time. I have developed on STM32 and 8051.

I have a Broadcom ADSL router running a customized linux firmware
developed with buildroot. I was able to clone the linux image from that
router. After some analysis, I discovered that the firmware was built in
2013. I was able to find info such as processor, wifi device, etc. I was
wondering what I would need to know/have to compile my own firmware for
this router using open source tools.

There are so many things involved such as bootloader, perhaps
proprietary code from broadcom, busybox, drivers for ADSL, wifi, USB
mass storage, etc. I looked on the internet for a comprehensive guide on
this topic, but didn't find anything very useful. I skimmed through the
buildroot documentation but I didn't find it very helpful for a beginner.

Any help would be appreciated!

Regards,
