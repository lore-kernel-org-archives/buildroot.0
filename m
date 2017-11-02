From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Fri, 03 Nov 2017 01:20:35 +0200
Subject: [Buildroot] [PATCH v2 1/1] turbovnc: new package
In-Reply-To: <20171102222811.4d501282@windsurf>
References: <1509367204-12966-1-git-send-email-stefan.froberg@petroprogram.com>	<20171101060657.tzjnt4ceb25irb3o@sapphire.tkos.co.il>	<20171101105305.1cd82e60@windsurf>	<59FB8C69.7050108@petroprogram.com>
 <20171102222811.4d501282@windsurf>
Message-ID: <59FBA843.7010006@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

2.11.2017, 23:28, Thomas Petazzoni kirjoitti:
>> I posted question to github if bzip2, freetype2 and zlib can be external
>> dependencies or if they contain some TurboVNC specific stuff.
> Thanks. Let's see what upstream says.
>
> Best regards,
>
> Thomas

Yeah. Im actually pretty excited to test and see how well TurboVNC 
server will perform with
Raspberry Pi 2 or 3 after reading about TurboVNCs possibility of
using multithreading on multi-core systems and other acceleration tricks.

https://github.com/TurboVNC/turbovnc/blob/master/doc/performance.txt

And then there is this:
https://github.com/TurboVNC/turbovnc/issues/95

I did not even know that there are 3 different implementations of
SIMD-accelerated zlib's out there.
:-O

-S-
