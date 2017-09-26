From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Tue, 26 Sep 2017 17:10:29 +0200
Subject: [Buildroot] [PATCH 3/3] sdl2: Add KMS/DRM(experimental) video
 driver support
In-Reply-To: <20170926170727.3fdcd9c9@windsurf.lan>
References: <20170926144723.17619-1-olivier.schonken@gmail.com>
 <20170926144723.17619-3-olivier.schonken@gmail.com>
 <20170926170727.3fdcd9c9@windsurf.lan>
Message-ID: <CALdGskKTn3HBvSg=HJ7m1iaAt_bVgEDNq1hMsa4EhFOkaGrkhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I tried to fit in with the style of the rest of the video drivers, should
they then change as well?

Regards

Olivier

On 26 September 2017 at 17:07, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Tue, 26 Sep 2017 16:47:23 +0200, Olivier Schonken wrote:
>
> > +config BR2_PACKAGE_SDL2_KMSDRM
> > +     bool "KMS/DRM video driver"
> > +     depends on BR2_PACKAGE_LIBDRM
>
> Please use a "select" here for libdrm. Don't forget to replicate the
> dependencies.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170926/9fb17898/attachment.html>
