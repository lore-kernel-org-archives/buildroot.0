From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jun 2013 18:00:15 +0200
Subject: [Buildroot] [PATCH 3/4] usb_modeswitch: bump to 1.2.6
In-Reply-To: <1371743610-17810-4-git-send-email-richard.genoud@gmail.com>
References: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
 <1371743610-17810-4-git-send-email-richard.genoud@gmail.com>
Message-ID: <20130620180015.72d60cc4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Richard Genoud,

On Thu, 20 Jun 2013 17:53:29 +0200, Richard Genoud wrote:
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
> ---
>  .../usb_modeswitch/usb_modeswitch-makefile.patch   |   31 --------------------
>  package/usb_modeswitch/usb_modeswitch.mk           |    2 +-
>  2 files changed, 1 insertion(+), 32 deletions(-)
>  delete mode 100644 package/usb_modeswitch/usb_modeswitch-makefile.patch

When bumping to a new version leads to the removal of some patches, it
is always good to mention /why/ they are removed (they got upstreamed,
they are no longer needed because..).

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
