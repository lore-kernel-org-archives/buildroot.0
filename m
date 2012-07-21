From: J.C. Woltz <jwoltz@gmail.com>
Date: Sat, 21 Jul 2012 14:01:11 -0400
Subject: [Buildroot] [PATCH v5 1/2] usb_modeswitch: update to 1.2.3
In-Reply-To: <20120715231223.5a77873f@skate>
References: <1332034235-17423-1-git-send-email-jwoltz@gmail.com>
 <1332034235-17423-2-git-send-email-jwoltz@gmail.com>
 <20120715231223.5a77873f@skate>
Message-ID: <CAC78GpdpNkFPe+MwdO5tS_6FmpL_yB9m-eXwRUqtCFAM4_X4vA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

I used TARGET_MAKE_ENV for the reason you specified. Arnout (or others)
told me to use it.
Also since this is an old thread, I was assuming my patch would not be
accepted at this point. I just gave up hope and kept my other packages to
myself.

JC

On Sun, Jul 15, 2012 at 5:12 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> [ Reviving an old thread... ]
>
> Le Sat, 17 Mar 2012 21:30:34 -0400,
> "J.C. Woltz" <jwoltz@gmail.com> a ?crit :
>
> > This patch updates usb_modeswitch to version 1.2.3.
> > The usb_modeswitch.mk needed to be modified for usb_modeswitch to
> compile.
> > Also added extra remove section for the added help scripts and files.
> >
> > Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
> > Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> > ---
> > replace TARGET_MAKE_ENV and add USB_MODESWITCH_UNINSTALL_CMDS
> > as recommended by Arnout Vandecappelle
>
> Why do you use TARGET_MAKE_ENV here? It seems much better to use
> TARGET_CONFIGURE_OPTS as you were doing in previous versions of your
> patch. Arnout, can you explain why you suggested using TARGET_MAKE_ENV
> instead of TARGET_CONFIGURE_OPTS?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120721/aef743a9/attachment.html>
