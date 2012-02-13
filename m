From: J.C. Woltz <jwoltz@gmail.com>
Date: Sun, 12 Feb 2012 21:57:05 -0500
Subject: [Buildroot] [PATCH v3-resend 1/2] usb_modeswitch: update to
	1.2.3
In-Reply-To: <201202122321.34627.arnout@mind.be>
References: <1329073793-524-1-git-send-email-jwoltz@gmail.com>
 <201202122321.34627.arnout@mind.be>
Message-ID: <CAC78GpfYU7HLUP3QnvbLboh91e4YkLs2JBc7Thf+WC=6y+9ELw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 12, 2012 at 5:21 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
> On Sunday 12 February 2012 20:09:52 J.C. Woltz wrote:
> > This patch updates usb_modeswitch to version 1.2.3.
> > The usb_modeswitch.mk needed to be modified for usb_modeswitch to compile.
> > Also added extra remove section for the added help scripts and files.
> >
> > Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> ?Thank you for your contribution!
>
> ?Still two remarks for the next time you make a patch.
>
> - Comments about the evolution of the patch, that don't need to end up
> in the git repository, like the one below, should go under three dashes.
> That way Peter can simply run 'git am' on your patch and the unnecessary
> comments will not be taken up in the git log.

Will do.

>
> - .patch files should have a comment at the top explaining why it is needed,
> and a Signed-off-by line. ?Also, try to send the patch upstream, so we
> don't need to carry it forward forever.

What do you mean by this? Buildroot already had a patch for
usb_modeswitch. The only thing my patch did to the makefile was remove
the -s flag from two install commands. On a normal system, the -s on
the install makes sense. In a buildroot environment where the software
is not installed directly, this patch was needed. If you still believe
that an upstream patch is needed, then I can do that.

>
> ?Regards,
> ?Arnout
>

Thank you,
J.C. Woltz
