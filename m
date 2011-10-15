From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Oct 2011 12:24:53 +0200
Subject: [Buildroot] [PATCH v5 3/3] New package: feh
In-Reply-To: <1318584328-6080-4-git-send-email-yegorslists@googlemail.com>
References: <1318584328-6080-1-git-send-email-yegorslists@googlemail.com>
 <1318584328-6080-4-git-send-email-yegorslists@googlemail.com>
Message-ID: <201110151224.54761.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Friday 14 October 2011 11:25:28, yegorslists at googlemail.com wrote:
> +config BR2_PACKAGE_FEH
> +       bool "feh"
> +       depends on BR2_PACKAGE_XORG7
> +       select BR2_PACKAGE_XLIB_LIBXINERAMA
> +       select BR2_PACKAGE_XLIB_LIBXT
> +       select BR2_PACKAGE_IMLIB2_PNG

 I've asked this before so you probably already considered it: is the
selection of PNG really necessary, or is it there to make sure there
is at least one useful backend?


 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111015/b7175b27/attachment.html>
