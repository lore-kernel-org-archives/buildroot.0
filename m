From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Wed, 29 Nov 2017 11:42:56 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-11-28
In-Reply-To: <20171129133649.57832b1c@windsurf.home>
References: <20171129070009.BC0F72037D@mail.free-electrons.com>
 <20171129102201.GI2889@scaer> <20171129133649.57832b1c@windsurf.home>
Message-ID: <CAB4xu_1zxQTDYJwfj33iPPgbB=TiczgfNuqNLpES8AEmmySz+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 29, 2017 at 7:36 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 29 Nov 2017 11:22:01 +0100, Yann E. MORIN wrote:
>> >          arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/624f2db9baad4f1d6c41ff74dc6310a4228679f2 |
>>
>>   CCLD     prog
>> OBJCOPY prog.debug
>> objcopy: Unable to recognise the format of the input file `prog'
>>
>> This is for an armv4.
>
> It also happened targetting ARMv5, see
> http://autobuild.buildroot.net/results/8a0/8a0e970b8adb6770ff9b1d18c4544654d511aadf/build-end.log.
> And targetting ARMv7, see
> http://autobuild.buildroot.net/results/b84/b84a6e39fcca70c56bfe49d54c385dfe6da82422/build-end.log.
>

Is there any way to get more details in those logs? Like the
output of `make V=1`.

Phil

> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
