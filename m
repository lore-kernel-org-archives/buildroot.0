From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 19 Nov 2015 20:53:27 +0100
Subject: [Buildroot] ADS7846 Module touch Raspberry PI 2 - Buildroot
In-Reply-To: <CACvocV7gAwsYYQ=C=Qg20_b+OfEigKtjLNOqCR6K6asGp2demw@mail.gmail.com>
References: <CACvocV7gAwsYYQ=C=Qg20_b+OfEigKtjLNOqCR6K6asGp2demw@mail.gmail.com>
Message-ID: <20151119205327.71f7f54e@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giovanni,

On Thu, 19 Nov 2015 20:28:39 +0100, "astrolite ." <ciclonite@gmail.com> wrote:

> Hi,
> I don't know if this question is really relevant with buildroot, but i've a
> problem using this module with devicetree.
> I've put into config.txt, the specific configuration for working with the
> touch display but nothing happen.
> In this tutorial :  http://brummbeere.readthedocs.org/en/latest/raspi.html
> there is note:
> 
> "
> To be able to add support for device tree overlays in a later step we need
> to download the Raspberry tools. The tools contain a script mkknlimg that
> adds a trailer to the self-compiled kernel.
> "
> What i need for use devicetree with buildroot?
> Thanks a lot,
> Giovanni.

The actual buildroot config for Raspberry Pi already contains new enough
kernel source and userland tools for device tree support, see [1] and
the mkknlimg hint (line 129ff). More hints for your touchpanel support see
[2] and [3]...

Regards,
Peter


[1] http://git.buildroot.net/buildroot/tree/board/raspberrypi/readme.txt
[2] https://github.com/notro/fbtft/wiki/Touchpanel
[3] https://github.com/raspberrypi/firmware/blob/master/boot/overlays/README
