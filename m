From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Jan 2014 23:20:09 +0100
Subject: [Buildroot] [PATCH] python-nfc: bump version
In-Reply-To: <1389170874-13922-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Wed, 8 Jan 2014 08:47:54 +0000")
References: <1389170874-13922-1-git-send-email-spdawson@gmail.com>
Message-ID: <87r48im7za.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > Signed-off-by: Simon Dawson <spdawson@gmail.com>
 > ---
 >  package/python-nfc/python-nfc.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/python-nfc/python-nfc.mk b/package/python-nfc/python-nfc.mk
 > index 5f486d9..4c14a17 100644
 > --- a/package/python-nfc/python-nfc.mk
 > +++ b/package/python-nfc/python-nfc.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -PYTHON_NFC_VERSION = 142
 > +PYTHON_NFC_VERSION = 212

I see we don't have any license info. Care to add it?

 >  PYTHON_NFC_SITE = https://launchpad.net/nfcpy
 >  PYTHON_NFC_SITE_METHOD = bzr
 >  PYTHON_NFC_DEPENDENCIES = libusb libusb-compat
 > -- 
 > 1.8.3.2

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
