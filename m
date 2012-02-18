From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Feb 2012 12:53:26 +0100
Subject: [Buildroot] [PATCH v4-resend 2/2] new program:
	usb_modeswitch_data
In-Reply-To: <1329266018-10392-1-git-send-email-jwoltz@gmail.com>
References: <1329266018-10392-1-git-send-email-jwoltz@gmail.com>
Message-ID: <201202181253.27056.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 15 February 2012 01:33:38 J.C. Woltz wrote:
> usb_modeswitch_data provides udev rules for usb VID/PID combinations to
> switch usb deices from their default mode into a more useable mode. The
> default mode usually is a cdrom with installation software that is of
> little use in an embedded linux situation
> 
> Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> diff --git a/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch b/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
> new file mode 100644
> index 0000000..024bc76
> --- /dev/null
> +++ b/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
> @@ -0,0 +1,24 @@
> +diff -Nura usb_modeswitch_data-20120120.orig/Makefile usb_modeswitch_data-20120120/Makefile
> +--- usb_modeswitch_data-20120120.orig/Makefile	2012-01-20 17:25:32.000000000 -0500
> ++++ usb_modeswitch_data-20120120/Makefile	2012-02-06 14:20:47.000000000 -0500

 Can you add a brief explanation of what the patch does, including a
Signed-off-by line?  Look at another patch as an example, e.g.
package/kexec/kexec-fix-linker-options.patch

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
