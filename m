From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 25 Apr 2016 11:49:11 +0200
Subject: [Buildroot] [help] Nitrogen6X with Vivante : restart on Qt5
	examples
In-Reply-To: <571DE4A9.2010605@free-electrons.com>
References: <571DDBEB.7070100@free-electrons.com>
 <CAAMH-yvb3G6gp+N9yGFAK7GNPAxy9m25Zjn5-QqHko-aMeJmSw@mail.gmail.com>
 <571DE4A9.2010605@free-electrons.com>
Message-ID: <CAAMH-yuXV8au48yim6u1cWb=-6YmJCwn7ogvG=p2xrgjxE4icQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mylene, All,

On Mon, Apr 25, 2016 at 11:34 AM, Mylene Josserand
<mylene.josserand@free-electrons.com> wrote:
> <snip>
>> This might sound strange, but please also provide the U-Boot version
>> you are using. The reason is that we offer a wide range of displays,
>> since we want customers to have a plug and play experience we've added
>> something for kernel >=3.14 where U-Boot is in charge of modifying the
>> device tree on the fly to setup the displays properly.
>
> Interesting, my uboot version is : U-Boot 2013.07.

Please update, you should use either v2015.07 or v2016.03.

You should be able to just run:
U-Boot> run upgradeu

In case it doesn't work, you should fine everything you need here:
https://boundarydevices.com/compiling-latest-u-boot-for-i-mx6-2015-edition/
https://boundarydevices.com/u-boot-v2016-03/

Please make sure to clear your U-Boot environment once updated.

Thanks,
Gary
