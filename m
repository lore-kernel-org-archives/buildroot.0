From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 21:28:00 +0100
Subject: [Buildroot] [ISSUE] gdk-pixbuf dependency on librsvg for its
 SVG loader
In-Reply-To: <CANVomh9E4fVo0tP7yTc0goGD5FD9f6BqNymSvLvz3wv6sQDV1g@mail.gmail.com>
References: <CANVomh9E4fVo0tP7yTc0goGD5FD9f6BqNymSvLvz3wv6sQDV1g@mail.gmail.com>
Message-ID: <20201205212800.13dce2d0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 2 Dec 2020 19:45:42 +0000
C Larbi <pkl2000us@gmail.com> wrote:

> GDK-PIXBUF provides image handling for gtk3.
> 
> To add SVG support, the librsvg package is required.
> 
> However, the configuration option " --disable-pixbuf-loader" in librsvg.mk
> prevents the required image loader to be built for GDK.
> 
> I suggest to the maintainers of the package to add a conditional clause in
> the makefile to add or remove this configuration option depending on
> whether the libgtk3 package has been selected

Thanks for your suggestion. Could you submit a patch implementing this?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
