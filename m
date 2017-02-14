From: Mylene Josserand <mylene.josserand@free-electrons.com>
Date: Tue, 14 Feb 2017 15:56:21 +0100
Subject: [Buildroot] Issue with Vivante OpenGL driver and X11
In-Reply-To: <20170214142113.di4mod3zmnjc52gg@t450s.lan>
References: <16509520-1f05-41eb-8053-24716f1091d4@free-electrons.com>
 <20170214142113.di4mod3zmnjc52gg@t450s.lan>
Message-ID: <8775b095-2254-947b-4d4f-919bcb9c1a6d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On 14/02/2017 15:21, Gary Bisson wrote:
> Hi Mylene, All,
>
> On Tue, Feb 14, 2017 at 03:06:28PM +0100, Mylene Josserand wrote:
>> Hello everyone,
>>
>> I got an issue with OpenGL Vivante support with X11 on Nitrogen board
>> (nitrogen6max).
>>
>> I am on Buildroot's Master branch, last commit:
>> 5bf12ad141f5de02c79c04a773e7709b87070229
>>
>> I tried Qt5 OpenGL examples and X is segfaulting. I tested with vivante
>> examples too (tutorial2) and same issue.
>>
>> You can find a log here:
>> http://code.bulix.org/wfkcna-115447
>>
>> Any idea? Did I miss something or configured something wrong?
>
> No, you're just the first lucky user trying X 1.19 on i.MX6Q.

Okay :)

>
> Fortunately for us Yocto users already faced that actually:
> https://lists.yoctoproject.org/pipermail/meta-freescale/2017-January/020127.html
>
> It seems that this patch is required on xserver:
> https://patchwork.openembedded.org/patch/136696/
>
> Can you try it and let us know how it goes?

Yes, I just tested it and adding this patch make the Vivante examples 
working fine without segfault error!

Are you going to send a patch to Buildroot to add this X11's patch? (I 
guess so)

Anyway, thank you for your help!

Best regards,

-- 
Myl?ne Josserand, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
