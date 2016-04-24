From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 24 Apr 2016 23:20:08 +0200
Subject: [Buildroot] [PATCH v5 1/5] barebox: support multi-image-build
 image selection
In-Reply-To: <20160424174329.0463eed6@free-electrons.com>
References: <cover.1461489060.git.pieter@boesman.nl>
 <29de37c67b83a26113d4fc7dab6e32832d329df3.1461489060.git.pieter@boesman.nl>
 <20160424174329.0463eed6@free-electrons.com>
Message-ID: <20160424212008.GA4689@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Apr 24, 2016 at 05:43:29PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 24 Apr 2016 11:18:43 +0200, Pieter Smith wrote:
> > Support optional selection of the built image filename in a multi-image barebox
> > build. This makes it possible to specify which image to pick in a multi-image
> > barebox config such as the am335x_defconfig.
> > 
> > Signed-off-by: Pieter Smith <pieter@boesman.nl>
> > ---
> >  boot/barebox/Config.in  | 10 ++++++++++
> >  boot/barebox/barebox.mk |  6 +++++-
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> Applied to master, after doing a few minor changes:
> 
>     [Thomas:
>      - remove default "", since this is the default for string options
>      - rename the prompt from "Barebox image filename" to "Image filename"
>      - slightly improve the Config.in help text.]
> 
> Thanks!

A pleasure!

[snip]

- Pieter
