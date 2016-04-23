From: Pieter Smith <pieter@boesman.nl>
Date: Sat, 23 Apr 2016 14:35:22 +0000
Subject: [Buildroot] [PATCH v4 0/7] Support building a second Barebox
 config (incl. BBB)
In-Reply-To: <20160423151129.479c5f03@free-electrons.com>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
 <20160419212441.6a0454e9@free-electrons.com> <20160419201733.GA19934@smipidev>
 <CAGm1_kv4ipig0JpHxiBDV7b0roUrY_7sr0To=iNJuNYR_YhtcA@mail.gmail.com>
 <20160420164216.GA26814@smipidev>
 <CAGm1_kughQAzmdbaQo4bBb4+-a1rL9-1aZunOCuLtFH4pgSUhA@mail.gmail.com>
 <20160421132905.7c271814@free-electrons.com> <20160423130141.GB10355@smipidev>
 <20160423151129.479c5f03@free-electrons.com>
Message-ID: <CAPho-_Kvdg37hhfujbg99BVwhP+jPcwnsZUH2=3G7qt0CVz7yw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, 23 Apr 2016, 15:11 Thomas Petazzoni, <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Sat, 23 Apr 2016 15:01:41 +0200, Pieter Smith wrote:
>
> > All that is left is the suggested BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE ->
> > BR2_TARGET_BAREBOX_IMAGE_FILE rename and a final master rebase, then I
> can
> > post.
>
> Good.
>
> > Flashing the boot.vfat separately seems to run afoul of such geometry
> > restrictions. Using genimage to generate a full sdcard.img however works
> well
> > on the BBB. I therefore did not spend more time on the issue because it
> works
> > now. Do you see any need to dig deeper, or can the patch be merged based
> on a
> > working sdcard.img?
>
> As long as the sdcard.img is working, that's fine.
>
> However, I'm still unsure we will want to merge a defconfig whose only
> difference compared to the other beablebone defconfig is that it uses
> Barebox. I certainly want to merge the rest of your series, since we do
> want to support the use case of people using Barebox on AM335x
> platforms, or other platforms that have a two-stage boot process. But
> I'm not sure about the defconfig.
>
> Peter, what's your opinion on this?
>

As I already voiced, I would like to have the defconfig in as a
usage example. An example dramatically cuts the amount
of time required to understand how to use the features.

I also find the BBB with barebox much easier to play with. It
boots faster and is much easier to script.

Do you have another board you would have me target to
Illustrate the features?


> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com


- Pieter
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160423/876be975/attachment.html>
