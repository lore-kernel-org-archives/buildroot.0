From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 16:10:10 +0100
Subject: [Buildroot] $(SED) not defined if 'make menuconfig
 savedefconfig'
In-Reply-To: <CAM+bi4vPDjVgiAiXV-ch9jbOo=B04dSce3w3QRsVfsxMgAYpzg@mail.gmail.com>
References: <CAM+bi4tjaJB2bJuQ40_cap55ZrEmOYg4Ssz+TMM_zg5Cb0yo6A@mail.gmail.com>
 <20150615153742.02ebdb85@free-electrons.com>
 <20150615142011.GA16458@dkarchlinux64.currentcomm.com>
 <CAM+bi4vL3aa+RO30s7ScAti=yykL+woGXpA=KaQMMgAd3HEd-g@mail.gmail.com>
 <CAM+bi4vPDjVgiAiXV-ch9jbOo=B04dSce3w3QRsVfsxMgAYpzg@mail.gmail.com>
Message-ID: <20160216161010.779981bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alvaro,

On Tue, 16 Feb 2016 12:46:55 +0100, Alvaro Gamez wrote:

> > I've just tested it too and can confirm that this fixes the problem and my
> > particular use case with buildroot-submodule.
> >
> > Tested-by: Alvaro G. M. <alvaro.gamez@hazent.com>
> >
> >
> I just wanted to query about the status of this patch. I haven't found it
> on patchwork, probably because it wasn't sent as a PATCH email on itself,
> but it was tested by Doug and me.
> 
> I can confirm it still applies and works as intended. If you need me to, I
> can git-email it.

Indeed this patch is not in patchwork. And if a patch is not in
patchwork, we will definitely forget about it. We have several hundreds
of patches already in patchwork, so we can hardly keep track of patches
that were not submitted in a form that allows them to be tracked by
patchwork.

So, it would be really good if you could submit this patch with 'git
send-email'.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
