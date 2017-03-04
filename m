From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 4 Mar 2017 16:07:04 +0100
Subject: [Buildroot] [PATCH] linux: Add CIP SLTS easy selection option
In-Reply-To: <20170304154222.7fbf231e@free-electrons.com>
References: <1488577816-19047-1-git-send-email-angelo.compagnucci@gmail.com>
 <20170303234636.0dbf4fd6@free-electrons.com>
 <7663394e-1ac6-07ae-a226-159605ac4011@mind.be>
 <20170304000243.35b8b146@free-electrons.com>
 <ecfd4a44-a1b8-19c9-f6c0-ba7998be2c85@mind.be>
 <20170304111105.03e2ffe2@free-electrons.com>
 <CA+TH9Vkxm4VdeBrTWAzWX6YGxrHT2-+OsMpGO0HaNeAHmQAYaw@mail.gmail.com>
 <f66ec9e0-6465-d2b8-eb02-5ada90dcbc75@mind.be>
 <CA+TH9VkMUTq7sFR9ED9aLgwUCbnnkXyO5uS7fwTyb5CynW2=bg@mail.gmail.com>
 <20170304151228.3de59a5c@free-electrons.com>
 <CA+TH9Vmp+wu4hXw+P_8E=GNBTAM0MGD1n4Gp_VNGEz0dZrZHpg@mail.gmail.com>
 <20170304154222.7fbf231e@free-electrons.com>
Message-ID: <CA+TH9Vntj+4Uqx1Uky44VYC3Rs8QGJ2Qrjyj+Ekyt8k+ewBzaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni ,

2017-03-04 15:42 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Sat, 4 Mar 2017 15:38:13 +0100, Angelo Compagnucci wrote:
>
>> > Clearly *NOT*. We want Buildroot builds to be reproducible. So if you
>> > take a given Buildroot version and configuration, it should *always*
>> > provide exactly the same output. So we need to use fixed versions of
>> > all the components.
>>
>> Obviously, I know. We could exclude the CIP kernel from the
>> reproducibility thing.
>
> There is nothing like "excluding feature <foo>" from the
> reproducibility thing.
>
>> This should not happens, or if this happens, there's fault in the CIP
>> project. Btw the project doesn't involves only a Linux kernel but all
>> the necessary infrastructure to be sure that a new minor release
>> doesn't brake everything.
>
> Right, but that's not the point. The point is that a given Buildroot
> version+configuration should always build the same thing, period.
> That's a very strong principle in Buildroot.
>
> If you want to upgrade your kernel to a newer version, you change your
> configuration.

If this is an insurmountable thing, than this patch could be
discarded. Obviously we can use a tag (there is v4.4.48-cip2 at this
moment) but what's the point? We should educate our users about
checking manually the latest release cause the one shipped with
buildroot could be older and unpatched. It's nonsense.

This problem is somewhat related to the standard kernel where we say
"Latest version (4.9.13)" (buildroot 2017.02) when indeed the latest
version at the time of writing is 4.10.1. Latest should be latest
imho.

Sincerely, Angelo.

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
