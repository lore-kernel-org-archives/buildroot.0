From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Oct 2011 23:35:05 +0200
Subject: [Buildroot] Derive HOST_FOO_DEPENDENCIES automatically
In-Reply-To: <1317676858-3407-1-git-send-email-arnout@mind.be>
References: <201110032133.44496.arnout@mind.be>
 <1317676858-3407-1-git-send-email-arnout@mind.be>
Message-ID: <201110032335.06739.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Monday 03 October 2011 23:20:36, Arnout Vandecappelle (Essensium/Mind) 
wrote:
> As requested by Luca, this patch series derives HOST_FOO_DEPENDENCIES
> automatically from FOO_DEPENDENCIES.

 By the way, there is a disappointingly large number of packages that have a 
difference between FOO_DEPENDENCIES and HOST_FOO_DEPENDENCIES:

package/autoconf/autoconf.mk
package/automake/automake.mk
package/cdrkit/cdrkit.mk
package/cloop/cloop.mk
package/crosstool-ng/crosstool-ng.mk
package/dbus-glib/dbus-glib.mk
package/dbus/dbus.mk
package/directfb/directfb.mk
package/file/file.mk
package/freetype/freetype.mk
package/gdk-pixbuf/gdk-pixbuf.mk
package/gob2/gob2.mk
package/intltool/intltool.mk
package/libglib2/libglib2.mk
package/libgtk2/libgtk2.mk
package/libxml2/libxml2.mk
package/libxslt/libxslt.mk
package/mtd/mtd.mk
package/python/python.mk
package/shared-mime-info/shared-mime-info.mk
package/squashfs/squashfs.mk
package/sstrip/sstrip.mk
package/x11r7/xutil_makedepend/xutil_makedepend.mk

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111003/58084a36/attachment-0002.html>
