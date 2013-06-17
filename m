From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Mon, 17 Jun 2013 20:09:51 +0000
Subject: [Buildroot] Changes in the Buildroot autobuilders
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C639A66D56@ex-mb1.corp.adtran.com>
References: <20130616180054.58f52914@skate> <20130616170305.GI3495@free.fr>
 <20130616191806.7b4a899a@skate> <20130616172508.GL3495@free.fr>
 <20130616200540.5a370504@skate> <20130617074535.GB16699@lukather>
 <20130617094958.33eaff88@skate>
 <CAEBucnCWYyj23_RyLtP3p-B6zmBYiYOA4LiODMEdxEr7x4D+xw@mail.gmail.com>
 <20130617175407.GA3202@free.fr>
 <F9C551623D2CBB4C9488801D14F864C639A66D56@ex-mb1.corp.adtran.com>
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D633A03317@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kennedy wrote:
>> So, there are three possibilities:
>> 
>>   - per-package _MAINTAINER variable in each .mk
>>   - global MAINTAINERS a bit like the Linux kernel
>>   - subscription from the autobuilder website
> I wonder if we could default to 2 if 1 is not set.  Are all packages
> really owned by someone?  I would guess that there are many that just
> exist and only get updated when someone needs to bump the version or
> if there is a corner case.

How would we handle architecture-specific failures for a package if we don't have a global MAINTAINERS file? Add another _MAINTAINER variable in the config.in.<arch> file?

Mischa
