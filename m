From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 23:20:08 +0200
Subject: [Buildroot] [PATCH v2 1/1] gst1-plugins-bad: update plugin
 licenses
In-Reply-To: <1526263928-5540-1-git-send-email-danomimanchego123@gmail.com>
References: <1526263928-5540-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20180519232008.6d98ade5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 May 2018 22:12:08 -0400, Danomi Manchego wrote:
> Update several of the licenses annotated in the gst1-plugins-bad.mk file.
> 
> 1. Specify GPL-2.0 in license info.
> * All of the *.[ch] that specify GPL also specify version 2 or later.
> 
> 2. Remove GPL from audiovisualizers.
> * Changlog notes move from GPL to LGPL. (2015-04-25)
> * docs/plugins/inspect/plugin-audiovisualizers.xml claims "LGPL".
> * All *.[ch] files under ./gst/audiovisualizers say "GNU Library General Public License".
> 
> 3. Add GPL to yadif.
> * Changelog notes that yadif is "GPL". (2013-02-07)
> * docs/plugins/inspect/plugin-yadif.xml claims "GPL".
> * All *.[ch] files under ./gst/yadif say "GNU General Public License" except for one "GNU Library General Public License".
> 
> 4. Remove UNKNOWN from fdk_aac.
> * docs/plugins/inspect/plugin-fdkaac.xml claims "LGPL".
> * All *.[ch] files under ./ext/fdkaac say "GNU Lesser" or "GNU Library General Public License".
> 
> 5. Add BSD-2c to dtls.
> * docs/plugins/inspect/plugin-dtls.xml claims "BSD".
> * All *.[ch] files under ./gst/dtls have BSD-2c text.
> 
> 6. Add BSD-2c to openh264.
> * Changelog notes that openh264 is "BSD-2". (2014-10-03)
> * docs/plugins/inspect/plugin-openh264.xml claims "BSD".
> * All *.[ch] files under ./ext/openh264 have BSD-2c text.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Changes v1 -> v2
>    - Fix spelling and subject/verb-agreement in commit log, per
>      feedback from Yann E. MORIN.
>    - Add Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
