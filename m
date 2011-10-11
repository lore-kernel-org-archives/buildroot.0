From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Oct 2011 18:17:27 +0200
Subject: [Buildroot] [PATCH v2] New package: ImLib2
In-Reply-To: <1318328770-9496-1-git-send-email-yegorslists@googlemail.com>
References: <1318328770-9496-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <201110111817.28102.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tuesday 11 October 2011 12:26:10, yegorslists at googlemail.com wrote:
[snip]
> +config BR2_PACKAGE_IMLIB2_X
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	select BR2_PACKAGE_XLIB_LIBXEXT
> +	bool "X support"
> +endif

 Shouldn't this depend on BR2_PACKAGE_XORG7 ?

[snip]

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111011/38cd0045/attachment-0001.html>
