From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 13 Jul 2011 09:12:17 +0200
Subject: [Buildroot] [PATCHv2] udev: bump to 172
In-Reply-To: <20110712234834.5786dab0@skate>
References: <4E1C5DE4.4010208@visionsystems.de> <20110712234834.5786dab0@skate>
Message-ID: <4E1D4551.8090404@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 12.07.2011 23:48, schrieb Thomas Petazzoni:
> Le Tue, 12 Jul 2011 16:44:52 +0200,
> Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :
>
>> +define UDEV_INSTALL_INITSCRIPT
>> +    $(INSTALL) -m 0755 package/udev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
>>  endef
> This isn't used anywhere. It looks like something like:
>
> UDEV_POST_INSTALL_TARGET_HOOKS += UDEV_INSTALL_INITSCRIPT

Fixed.

Yegor
