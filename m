From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 20 Sep 2016 12:15:15 +0200
Subject: [Buildroot] Improved patches for Arietta G25 and Aria G25 boards
In-Reply-To: <20160920120911.695c6a20@free-electrons.com>
References: <1474356875-27902-1-git-send-email-biagio.hkr@gmail.com>
 <CA+TH9VnFhhz5mG9POQ4JdamrqEkFia1e=SU=vr1b5_QDD7r8Wg@mail.gmail.com>
 <20160920120911.695c6a20@free-electrons.com>
Message-ID: <CA+TH9VkNNZKq--XNUO6u9Yh2=L9J+E7jZjrS7x8GY=nu+=UHKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2016-09-20 12:09 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@free-
electrons.com>:

> Hello,
>
> On Tue, 20 Sep 2016 09:54:25 +0200, Angelo Compagnucci wrote:
>
> > a) Probably you have not grasped the details of image generation, these
> > lines:
> >
> > file boot.bin {
> >     image = "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.7.bin"
> > }
> >
> > renames the the image file
> > at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.7.bin to boot.bin just
> at
> > the moment of building the sdcard image, so I can't see why we need
> another
> > script.
>
> I agree.
>
> > b) I think you have to send your patches to the Tanzilli's github with a
> > pull request, I really prefer to have all the Acmesystems related patches
> > into his repo.
>
> I don't understand what you mean here. There are no kernel or
> bootloader patches added by Biagio patches.
>
> Or maybe you're suggesting that the Buildroot patches themselves should
> be sent to Tanzilli's Github?
>

Biagio changed the repository for at91bootstrap to his own fork. I would
really prefer to have all related Acmesystems patches into the Tanzilli's
repo cause he is the maintainer for his own products patches.

Sincerely, Angelo


>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160920/287a1f36/attachment.html>
