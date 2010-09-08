From: Andrew Gatt <mailinglist@gatt.me>
Date: Wed, 08 Sep 2010 14:33:34 +0100
Subject: [Buildroot] Qt QtUiTools
In-Reply-To: <20100908122951.5b2f9761@surf>
References: <AANLkTinS00d+cpiORtAghjVRibz+_3K5Zh1mWBzPBLbw@mail.gmail.com>
	<20100908122951.5b2f9761@surf>
Message-ID: <4C8790AE.50000@gatt.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>> I've recently used the Qt build of buildroot and noticed that I
>> couldn't use QUiLoader, I had to add "-make tools" to the configure
>> line to compile the necessary libraries so that I could use these
>> functions. I don't believe it affects the rootfs size (although I
>> have to admit I didn't run a test), but the extra functionality gets
>> compiled into the executable if i understand it correctly. It will
>> however increase build time. No other libraries require copying
>> across.
>>
>> I was wondering if it would be worth adding this as an option to
>> menuconfig so that it can be built if required.
> I don't know what QtUiTools are, but if it's useful for you, it's
> probably useful for others as well. So, yes, having this as a
> menuconfig option makes sense.
>
> Could you submit a patch that implements this ?
Please find attached the two patches for the "buildroot/packages/qt/" 
folder. I've not submitted a patch here before so please let me know if 
these are in the correct format etc.

Andrew

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: Config.in_patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100908/0e0e0814/attachment.ksh>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: qt.mk_patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100908/0e0e0814/attachment-0001.ksh>
