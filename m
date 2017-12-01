From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 1 Dec 2017 10:44:16 +0100
Subject: [Buildroot] [PATCH] uboot-tools: fix dtc invocation
In-Reply-To: <20171201095257.0db57c88@windsurf.lan>
References: <20171201073027.23072-1-yegorslists@googlemail.com>
 <20171201095257.0db57c88@windsurf.lan>
Message-ID: <CAGm1_ktQJXpwFGttU_UQ0XJyjFwBRPDaCyqZVf7_q1gHvHZ5PA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Dec 1, 2017 at 9:52 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri,  1 Dec 2017 08:30:27 +0100, yegorslists at googlemail.com wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> In Buildroot we don't perform Kconfig configuration for
>> u-boot-tools, hence CONFIG_MKIMAGE_DTC_PATH is empty.
>
> Should we do a Kconfig configuration ?
>
> Or alternatively, can we pass CONFIG_MKIMAGE_DTC_PATH=dtc on the build
> command line ?

I'll try this :-)

> Also: is this broken in master ? In next ? What is this fixing ? (Note:
> I know all of this because we discussed it on IRC, but it should be in
> the commit log).

Got. it. I'll send v2 as soon as big merge is completed.

Regards,
Yegor
