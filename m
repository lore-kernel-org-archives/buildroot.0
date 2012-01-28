From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 29 Jan 2012 00:07:01 +0100
Subject: [Buildroot] [PATCH 06/16] external-toolchain: remove 2009q1 ARM
 Sourcery toolchain
In-Reply-To: <20120128221651.088334df@skate>
References: <cover.1327772176.git.thomas.petazzoni@free-electrons.com>
 <e5683e82c67fffb7f73e14f6798fa5a2d06318bc.1327772176.git.thomas.petazzoni@free-electrons.com>
 <CAGm1_ksXAOCRaaKMB9G+cpLd8UCnt-z=wjVb3UasXYx3HnmZ_g@mail.gmail.com>
 <20120128221651.088334df@skate>
Message-ID: <CAGm1_kvzD_6=NhDTR4mWEg5QgKQgtcx0GMbL2P5F6Zpbq2d5jQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 28, 2012 at 10:16 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello Yegor,
>
> Le Sat, 28 Jan 2012 20:50:48 +0100,
> Yegor Yefremov <yegorslists@googlemail.com> a ?crit :
>
>> I still have an issue with CodeSourcery toolchain and u-boot for TI
>> (am3517):
>>
>> CodeSourcery toolchains from 2009 produce correct code, but two latest
>> produce wrong code (u-boot is functioning, but cannot start kernel). I
>> reported on this issue for some time and last week I worked with
>> u-boot again and tested various toolchains. Peter, you said you're
>> going to work with TI hardware, could you please check this issue?
>
> That's good to know, but I don't think it should prevent the newest
> CodeSourcery toolchains from being integrated into Buildroot: there are
> many other targets for which they generate correct code. Or maybe I
> missed your point?

I'm not against new versions. I just like to understand and fix the
issue. Perhaps I should ask this question in the u-boot mailing list.

Yegor
