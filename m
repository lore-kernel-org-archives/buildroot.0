From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Jun 2021 11:23:46 +0200
Subject: [Buildroot] [RPi4] Enable GTK3 on Buildroot
In-Reply-To: <CAHEfaqaqb213HJAdUV7x3K_gk=mFCsdc_5ozFuykD3AU53xmoQ@mail.gmail.com>
References: <CAHEfaqaqb213HJAdUV7x3K_gk=mFCsdc_5ozFuykD3AU53xmoQ@mail.gmail.com>
Message-ID: <20210602112346.472e95a5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 Jun 2021 15:21:29 -0600
Derek T <derek.tata1@gmail.com> wrote:

> I am trying to enable GTK3 on Buildroot to deploy to a Raspberry Pi 4, and
> having trouble initializing the Xorg server with an HDMI display.  The
> persistent error seems to be an undefined symbol while loading
> fbturbo_drv.so.  I tried manually loading the libraries in the config file,
> which helped with some of the undefined symbol errors, but the symbol
> "fbdevHWSave" has continued to throw an error.  I have a Weston daemon
> running on the device, and on boot a desktop screen shows up on the
> display.

If you already have Weston up and running, why are you not using the
Wayland backend of Gtk3 ? It seems more logical than trying to get
X.org working.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
