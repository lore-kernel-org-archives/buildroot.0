From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 13 Sep 2014 21:51:37 +0200
Subject: [Buildroot] [PATCH] heirloom-mailx: add license info
In-Reply-To: <1410584439-31668-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Sat, 13 Sep 2014 01:00:39 -0400")
References: <1410584439-31668-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87mwa38fjq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
 > ---
 >  package/heirloom-mailx/heirloom-mailx.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
 > index 75221d4..0a80a3c 100644
 > --- a/package/heirloom-mailx/heirloom-mailx.mk
 > +++ b/package/heirloom-mailx/heirloom-mailx.mk
 > @@ -7,6 +7,8 @@
 >  HEIRLOOM_MAILX_VERSION = 12.5
 >  HEIRLOOM_MAILX_SOURCE  = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION).orig.tar.gz
 >  HEIRLOOM_MAILX_SITE    = http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/h/heirloom-mailx
 > +HEIRLOOM_MAILX_LICENSE = BSD-4c, Bellcore (base64), IEEE (docs), OpenVision (imap_gssapi), RSA Data Security (md5), Network Working Group (hmac), MPLv1.1 (nss)
 > +HEIRLOOM_MAILX_LICENSE_FILES = COPYING

Committed with the IEEE part dropped as suggested by Baruch.

-- 
Bye, Peter Korsgaard
