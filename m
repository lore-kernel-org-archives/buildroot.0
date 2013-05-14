From: Sonic Zhang <sonic.adi@gmail.com>
Date: Tue, 14 May 2013 15:57:49 +0800
Subject: [Buildroot] [PATCH] toolchain: blackfin: Remove Blackfin
 toolchain 2011R1 release.
In-Reply-To: <20130514094214.1414d216@skate>
References: <1365580213-23039-1-git-send-email-sonic.adi@gmail.com>
 <CAJxxZ0MT5top5C8-jMMrqeSOiSpeMvLDVXx5f3EmU4gZSX6kPQ@mail.gmail.com>
 <20130514094214.1414d216@skate>
Message-ID: <CAJxxZ0M+SDkyQeadhvmmMXgM9R=dqJU3Pdhq8b1Qef2nDDhLKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, May 14, 2013 at 3:42 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Sonic Zhang,
>
> On Tue, 14 May 2013 15:32:05 +0800, Sonic Zhang wrote:
>
>> On Wed, Apr 10, 2013 at 3:50 PM, Sonic Zhang <sonic.adi@gmail.com> wrote:
>> > From: Sonic Zhang <sonic.zhang@analog.com>
>> >
>> > Blackfin is supported in buildroot since 2012R1 release.
>> >
>> > Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
>>
>> Could you Acked-by this patch at least for -next tree?
>
> Honestly, I don't understand this patch, and the commit log doesn't
> explain much about it.
>
> 2012R1 is not a Buildroot version.
>
> And Blackfin toolchains were supported in Buildroot before the 2012R1
> release of the Blackfin toolchains.
>
> Could you point to specific problems with this toolchain, or give a
> more precise commit log?
>

ADI officially supports the buildroot and related GNU toolchain for
Blackfin since ADI's 2012R1 release only. In order to avoid confusion,
it is better to remove the 2011R1 GNU toolchain for Blackfin. In
addition, the 2011R1 GNU toolchain for Blackfin doesn't support the
BF60x processors.

Regards,

Sonic
