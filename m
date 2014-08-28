From: Pradeep Kiruvale <pradeepkiruvale@gmail.com>
Date: Thu, 28 Aug 2014 09:38:05 +0200
Subject: [Buildroot] Rootfs for aarch64
In-Reply-To: <CAJ2SuLk6GF2STOTGRAKE2UavHr2m+xyjuLZpU4tZA5GFQpYK4w@mail.gmail.com>
References: <CAJ2SuL=yhZdq-aQ3Up4mkL29troM9ieq8qxXTVux0NYYapao=A@mail.gmail.com>
 <CAFbHwiSOfj7tctecfL7uAj3g2pSCLbg_282JhYE_SPRyja7ooQ@mail.gmail.com>
 <CAJ2SuLmY8rAq0aYmWpWeOdkbRXo+c50_YnLvtYP=JguLLmadqA@mail.gmail.com>
 <CAFbHwiQV9=HzA+pAESjiy2QsszZSbG2-itXqY0eh8bo5PppDGg@mail.gmail.com>
 <CAJ2SuLk6GF2STOTGRAKE2UavHr2m+xyjuLZpU4tZA5GFQpYK4w@mail.gmail.com>
Message-ID: <CAJ2SuLmuBCToiP5z56hTKXTB5hdJ0=mH0SkQAS4=hbmbK21g4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Will,

I tested this rootfs you pointed. But it does not have the network devices
in /dev and many other devices.

So if I say ifconfig it can't get network configurations. Please let me
know how can I get full rootfs.

Regards,
Pradeep


On 27 August 2014 20:16, Pradeep Kiruvale <pradeepkiruvale@gmail.com> wrote:

> Thanks a lot.
>
> Regards,
> Pradeep
>
>
> On 27 August 2014 17:53, Will Newton <will.newton@gmail.com> wrote:
>
>> On Wed, Aug 27, 2014 at 4:44 PM, Pradeep Kiruvale
>> <pradeepkiruvale@gmail.com> wrote:
>> > Hi Will,
>> >
>> > Thanks for the quick reply. I am just trying with foundation first and
>> then
>> > planing to move to qemu.
>> >
>> > I tried searching for ubuntu I dint find. Can you please tell me from
>> where
>> > I can download ubuntu for aarch64?
>>
>> There is a rootfs here:
>>
>> http://cdimage.ubuntu.com/ubuntu-core/daily/current/
>>
>> (It is called arm64 in Debian/Ubuntu)
>>
>> > Regards,
>> > Pradeep
>> >
>> >
>> > On 27 August 2014 17:27, Will Newton <will.newton@gmail.com> wrote:
>> >>
>> >> On Wed, Aug 27, 2014 at 4:12 PM, Pradeep Kiruvale
>> >> <pradeepkiruvale@gmail.com> wrote:
>> >> > Hi All,
>> >> >
>> >> > I am very new to aarch64/arm64. I want to port some application from
>> x86
>> >> > to
>> >> > arm64
>> >> > so I need to build a environment for porting and testing the
>> software.
>> >> > Please let me
>> >> > know how can I create a rootfile system and image for the newer
>> version
>> >> > of
>> >> > the linux.
>> >> >
>> >> > I want to build a full fledged rootfs with all possible libraries and
>> >> > want
>> >> > to mount nfs.
>> >> >
>> >> > I did try for a while, do to some configuration issues I am not able
>> to
>> >> > boot
>> >> > the image
>> >> > which I built on x86. I am using linaro foundation as a simulator.
>> >>
>> >> In general unless you need to I would use qemu over the foundation
>> >> model as it is quicker and IMO easier to work with.
>> >>
>> >> This blog post gives some detail about using it:
>> >>
>> >>
>> >>
>> http://www.bennee.com/~alex/blog/2014/05/09/running-linux-in-qemus-aarch64-system-emulation-mode/
>> >>
>> >> Also note that Ubuntu (and Fedora) is available for aarch64 so if you
>> >> want a full development system with package management that may be
>> >> more suitable.
>> >
>> >
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140828/ce47dbcf/attachment.html>
