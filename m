From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Oct 2011 12:58:26 +0200
Subject: [Buildroot] [PATCH 6/9] Qt commercial support
In-Reply-To: <1318603921-22899-7-git-send-email-will_wagner@carallon.com>
References: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
 <1318603921-22899-7-git-send-email-will_wagner@carallon.com>
Message-ID: <201110151258.27554.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Friday 14 October 2011 16:51:58, Will Wagner wrote:
[snip]
> +ifeq ($(BR2_PACKAGE_QT_LICENSE_COMMERCIAL),y)
> +QT_SITE    = file://$(HOME)
> +endif

 The download location of the tar file should be a configuration option.
$(DL_DIR) seems like a better default for it.


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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111015/abde127d/attachment.html>
