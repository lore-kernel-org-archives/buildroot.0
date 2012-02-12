From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Feb 2012 23:21:34 +0100
Subject: [Buildroot] [PATCH v3-resend 1/2] usb_modeswitch: update to
	1.2.3
In-Reply-To: <1329073793-524-1-git-send-email-jwoltz@gmail.com>
References: <1329073793-524-1-git-send-email-jwoltz@gmail.com>
Message-ID: <201202122321.34627.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 12 February 2012 20:09:52 J.C. Woltz wrote:
> This patch updates usb_modeswitch to version 1.2.3.
> The usb_modeswitch.mk needed to be modified for usb_modeswitch to compile.
> Also added extra remove section for the added help scripts and files.
> 
> Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Thank you for your contribution!

 Still two remarks for the next time you make a patch.

- Comments about the evolution of the patch, that don't need to end up
in the git repository, like the one below, should go under three dashes.
That way Peter can simply run 'git am' on your patch and the unnecessary
comments will not be taken up in the git log.

- .patch files should have a comment at the top explaining why it is needed,
and a Signed-off-by line.  Also, try to send the patch upstream, so we
don't need to carry it forward forever.

 Regards,
 Arnout


> replace TARGET_MAKE_ENV and add USB_MODESWITCH_UNINSTALL_CMDS
> as recommended by Arnout Vandecappelle
> 
> Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
> ---
[snip]

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
