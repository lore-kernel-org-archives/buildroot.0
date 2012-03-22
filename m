From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Mar 2012 22:37:51 +0100
Subject: [Buildroot] [git commit] kmod: add option to install module
	utilities
In-Reply-To: <20120322150326.7CEA39693E@busybox.osuosl.org>
References: <20120322150326.7CEA39693E@busybox.osuosl.org>
Message-ID: <201203222237.51909.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 22 March 2012 16:03:12 Peter Korsgaard wrote:
> +config BR2_PACKAGE_KMOD_TOOLS
> +       bool "kmod utilities"
> +       help
> +         Install kmod module utilities (depmod, insmod, lsmod,
> +         modinfo, modprobe, rmmod).

 Shouldn't this depend on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120322/f1d7221f/attachment.html>
