From: John Stile <john@stilen.com>
Date: Tue, 29 Jan 2013 12:37:45 -0800
Subject: [Buildroot] configure buildroot to patch at91bootstrap
In-Reply-To: <1359491391.7974.190.camel@genx>
References: <1359491391.7974.190.camel@genx>
Message-ID: <1359491865.7974.191.camel@genx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2013-01-29 at 12:29 -0800, John Stile wrote:
> I have modified output/build/at91bootstrap-1.16, and now I would like to
> save the patch set and have it applied when I rebuild at91bootstrap-1.16
> from scratch.
> 
> To my buildroot .conf file, I added:
> BR2_TARGET_AT91BOOTSTRAP_PATCH="$(TOPDIR)/board/atmel/at91sam9g20ek/at91bootstrap-patch"
> but it is erased from .config after running make.
> 
> My patch is named at91bootstrap-1.16-my_stuff.patch
> 
> The patch is not being applied.
> 
> Am I doing something wrong?
> 
I should have mentioned I am stuck on buildroot-2011.11.
If there is a fix, can I back port into this version?
