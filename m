From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 28 May 2015 13:05:00 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-05-27
In-Reply-To: <20150528115902.01440c3e@free-electrons.com>
References: <20150528063014.33A10100E89@stock.ovh.net>
 <CAMo8Bf+rVtLH0OizwAcc4Wds50UkgpMppS+m1=RGL3=dfA8iJQ@mail.gmail.com>
 <20150528095356.GD2260@tarshish>
 <20150528115902.01440c3e@free-electrons.com>
Message-ID: <CAMo8BfKodv5JiY0YSUhwYaK2MMF+UXWWGL2jiqFhuCwmDWKqeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 28, 2015 at 12:59 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Baruch,
>
> On Thu, 28 May 2015 12:53:56 +0300, Baruch Siach wrote:
>> Hi Max,
>>
>> On Thu, May 28, 2015 at 12:49:35PM +0300, Max Filippov wrote:
>> > On Thu, May 28, 2015 at 9:30 AM, Thomas Petazzoni
>> > <thomas.petazzoni@free-electrons.com> wrote:
>> > > Build statistics for 2015-05-27
>> > >
>> > >       xtensa |                harfbuzz-0.9.40 | NOK | http://autobuild.buildroot.net/results/15aadcad23a79bdb64789a6edd271f1aca999973/
>> >
>> > Fixed by https://patchwork.ozlabs.org/patch/476389/
>>
>> Thanks for fixing. But technically, since this build uses an external
>> toolchain, it will only be fixed when Thomas rebuilds the toolchain.
>
> I typically rebuild all toolchains after a Buildroot release has been
> made, so it should happen soon, hopefully.

I wonder if I should resend that patch with changes suggested by
Arnout (for all arches, not only for xtensa and with TARGET_CFLAGS
instead of TARGET_ABI), or its v1 is fine?

-- 
Thanks.
-- Max
