From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 18 Apr 2016 12:31:11 +0200
Subject: [Buildroot] [PATCH] gst1-imx: make kernel dependency optional
In-Reply-To: <20160418102839.GI4414@sapphire.tkos.co.il>
References: <97bf649b600a5548cfd3c53575747a057f24e07e.1460973919.git.baruch@tkos.co.il>
 <CAAMH-ysFMBA9bDK4h2KQv-HBmjMYmqzdZX1YhBwKzr-7VXz8zw@mail.gmail.com>
 <20160418102839.GI4414@sapphire.tkos.co.il>
Message-ID: <CAAMH-ysKb5Q7ZxiB5pt4hnj3Di4XL+-OTRaXeYMaj4kkKA9zUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On Mon, Apr 18, 2016 at 12:28 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Gary,
>
> On Mon, Apr 18, 2016 at 12:18:28PM +0200, Gary Bisson wrote:
>> On Mon, Apr 18, 2016 at 12:05 PM, Baruch Siach <baruch@tkos.co.il> wrote:
>> > The i.MX specific kernel headers are not a hard dependency. Quoting README.md:
>> >
>> >   Without [--kernel-headers], the [ipu.h] header is not found, and elements
>> >   using the IPU will not be built.
>>
>> That is true, it isn't a hard dependency, the reason I left it like
>> that is because if the headers aren't found and none of the other
>> configurations (plugins-bad, imx-gpu-viv or libimxvpuapi) are set, no
>> actual plugin will be built which could be confusing.
>>
>> Although this patch is correct and legit, I'd rather go ahead and
>> rework the entire package since Carlos worked on being able to
>> select/disable each and individual plugin since version 0.12.1:
>> https://github.com/Freescale/meta-fsl-arm/commit/cec4c47e
>
> This is event better. Do you have something ready to test?

No unfortunately I'm swamped right now, didn't have time to prepare a
patch yet, not sure I will have any time until next week.

If you need the modification and have the time to do it, please go
ahead and I will test/review it.

Regards,
Gary
