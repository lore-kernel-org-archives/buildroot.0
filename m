From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 13 Sep 2014 21:51:13 +0200
Subject: [Buildroot] [PATCH] heirloom-mailx: add license info
In-Reply-To: <20140913184329.GA11424@tarshish> (Baruch Siach's message of
 "Sat, 13 Sep 2014 21:43:29 +0300")
References: <1410584439-31668-1-git-send-email-danomimanchego123@gmail.com>
 <20140913184329.GA11424@tarshish>
Message-ID: <87r3zf8fke.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Danomi,
 > On Sat, Sep 13, 2014 at 01:00:39AM -0400, Danomi Manchego wrote:
 >> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
 >> ---
 >> package/heirloom-mailx/heirloom-mailx.mk | 2 ++
 >> 1 file changed, 2 insertions(+)
 >> 
 >> diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
 >> index 75221d4..0a80a3c 100644
 >> --- a/package/heirloom-mailx/heirloom-mailx.mk
 >> +++ b/package/heirloom-mailx/heirloom-mailx.mk
 >> @@ -7,6 +7,8 @@
 >> HEIRLOOM_MAILX_VERSION = 12.5
 >> HEIRLOOM_MAILX_SOURCE  = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION).orig.tar.gz
 >> HEIRLOOM_MAILX_SITE    = http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/h/heirloom-mailx
 >> +HEIRLOOM_MAILX_LICENSE = BSD-4c, Bellcore (base64), IEEE (docs), OpenVision (imap_gssapi), RSA Data Security (md5), Network Working Group (hmac), MPLv1.1 (nss)

 > Do we install these IEEE licensed docs? If not I think we can omit this 
 > license. IANAL, though.

True. The only documentation getting installed is the man pages, and we
delete them unless the deprecated BR2_HAVE_DOCUMENTATION option is
enabled.

So I think we can skip it.

-- 
Bye, Peter Korsgaard
