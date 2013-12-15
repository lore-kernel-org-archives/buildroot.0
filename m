From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Dec 2013 09:26:36 +0100
Subject: [Buildroot] [PATCH 1/2] ccid: bump to version 1.4.14
In-Reply-To: <1387005620.16935.0.camel@phoenix> (Axel Lin's message of "Sat,
 14 Dec 2013 15:20:20 +0800")
References: <1387005620.16935.0.camel@phoenix>
Message-ID: <877gb6y0xv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 > Signed-off-by: Axel Lin <axel.lin@ingics.com>
 > ---
 >  package/ccid/ccid.mk | 4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
 > index aabc0c0..e337053 100644
 > --- a/package/ccid/ccid.mk
 > +++ b/package/ccid/ccid.mk
 > @@ -4,9 +4,9 @@
 >  #
 >  ################################################################################
 
 > -CCID_VERSION = 1.4.13
 > +CCID_VERSION = 1.4.14
 >  CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
 > -CCID_SITE = http://alioth.debian.org/frs/download.php/file/3959
 > +CCID_SITE = http://alioth.debian.org/frs/download.php/file/3967

Typo, SITE should end on 3917. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
