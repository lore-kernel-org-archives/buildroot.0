From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 25 Sep 2007 14:16:53 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/mplayer
In-Reply-To: <20070925120128.9F46230108@busybox.net>
References: <20070925120128.9F46230108@busybox.net>
Message-ID: <20070925121653.GA15542@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 25, 2007 at 05:01:28AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-09-25 05:01:27 -0700 (Tue, 25 Sep 2007)
>New Revision: 20013
>
>Log:
>Add source and unpacked targets to mplayer

$ find package/ -name "*.mk" -exec grep --exclude='*.svn*' -L
"\-source:" {} \; | grep -v x11r7
package/alsa-utils/alsa-utils.mk
package/busybox/initramfs.mk
package/gnuconfig/gnuconfig.mk
package/fbset/fbset.mk
package/alsa-lib/alsa-lib.mk
package/irda-utils/irda.mk
package/qte/qte.mk
package/customize/customize.mk
package/fusion/fusion.mk
package/ed/ed.mk
package/mtd/mtd.mk
package/imagemagick/imagemagick.mk


initramfs.mk is ok
gnuconfig.mk is ok

I'll take care of ed (done by now), the rest look like bugs introduced
by others..
