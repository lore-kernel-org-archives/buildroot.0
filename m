From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jul 2013 09:16:29 +0200
Subject: [Buildroot] [RFC 2/3] sunxi-mali: new package
In-Reply-To: <CAEBucnB9sJ=LX6m5vgVSH1gRQ1nwcTtj9r5HwEKgCxTq=cVvjA@mail.gmail.com>
References: <1373778632-16531-1-git-send-email-spenser@gillilanding.com>
 <1373778632-16531-3-git-send-email-spenser@gillilanding.com>
 <20130716201400.GA7947@free.fr>
 <CAEBucnB9sJ=LX6m5vgVSH1gRQ1nwcTtj9r5HwEKgCxTq=cVvjA@mail.gmail.com>
Message-ID: <20130718091629.75a6ccf3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Thu, 18 Jul 2013 01:12:17 -0500, Spenser Gilliland wrote:

> > On 2013-07-14 00:10 -0500, Spenser Gilliland spake thusly:
> >> +config BR2_PACKAGE_SUNXI_MALI
> >> +     bool "sunxi-mali"
> >
> > Do you plan on looking to the open source driver, lima, as an
> > alternative to mali?
> 
> Yes, I've been looking at it but I'm not sure we should package it
> just yet.  I'm going to work on the ODroidU2 first and come back to
> this.

Is lima actually usable today as a drop-in replacement for libOpenGLES,
libEGL and so on? Last time I had some infos, my understanding was that
it was still some experimental code that isn't yet available in a form
of a drop-in OpenGL ES implementation. I've been looking around
yesterday for more details on the Lima website, but things aren't
really clear, even by having a quick look at the source code.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
