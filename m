From: gregory hermant <gregory.hermant@calao-systems.com>
Date: Thu, 19 Jul 2012 11:34:48 +0200
Subject: [Buildroot] [PATCH v2] Add support for the Calao-systems
	USB-A9G20-LPW
In-Reply-To: <20120713214717.78bcb790@skate>
References: <4FFD9086.20804@calao-systems.com> <20120713214717.78bcb790@skate>
Message-ID: <5007D4B8.4010906@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi thomas,

Thomas Petazzoni wrote:
> Le Wed, 11 Jul 2012 16:41:10 +0200,
> gregory hermant <gregory.hermant@calao-systems.com> a ?crit :
> 
>> Hi,
>> Attached a new patch for the USB-A9G20-LPW. 
>> I2C and RTC support added in the linux kernel defconfig file. 
> 
> This shouldn't be part of the commit log. If you want to provide a
> changelog from the previous version, put it after the --- line below.
> 
>>  .../at91bootstrap-1.16-usb-a9g20-lpw.patch         |  610 ++++++++++++++++++++
>>  .../barebox-2012.07.0-usb-a9g20-lpw.patch          |   12 +
> 
> Is the barebox patch really necessary? Has it been submitted upstream?
> 
Not yet submitted.
Actually with the default config file, barebox.bin is > 256KB.
I have to see how to solve this minor issue.

>>  board/calao/usb-a9g20-lpw/usb_a9g20_lpw_defconfig  |  105 ++++
> 
> This file is the kernel configuration, it should rather be named
> linux-<version>.config (see other boards in board/).
> 
ok
> Thanks,
> 
> Thomas

Thanks
gregory
