From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Nov 2013 10:06:06 +0100
Subject: [Buildroot] [PATCH] gutenprint: fix download url
In-Reply-To: <1383912716-31202-1-git-send-email-arnaud.aujon@gmail.com>
 (Arnaud Aujon's message of "Fri, 8 Nov 2013 13:11:56 +0100")
References: <1383912716-31202-1-git-send-email-arnaud.aujon@gmail.com>
Message-ID: <87habkeidd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnaud" == Arnaud Aujon <arnaud.aujon@gmail.com> writes:

 > Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
 > ---
 >  package/gutenprint/gutenprint.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
 > index 33abf48..0924cb6 100644
 > --- a/package/gutenprint/gutenprint.mk
 > +++ b/package/gutenprint/gutenprint.mk
 > @@ -5,7 +5,7 @@
 >  ################################################################################
 
 >  GUTENPRINT_VERSION = 5.2.9
 > -GUTENPRINT_SITE = http://downloads.sourceforge.net/gimp-print/gutenprint-5.2/$(GUTENPRINT_VERSION)
 > +GUTENPRINT_SITE = http://downloads.sourceforge.net/project/gimp-print/gutenprint-5.2/$(GUTENPRINT_VERSION)

The old address still works (redirects), but OK:

http://downloads.sourceforge.net/gimp-print/gutenprint-5.2/5.2.9/gutenprint-5.2.9.tar.bz2
Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 216.34.181.59
Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|216.34.181.59|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location: http://kent.dl.sourceforge.net/project/gimp-print/gutenprint-5.2/5.2.9/gutenprint-5.2.9.tar.bz2 [following]

Committed, thanks.

-- 
Bye, Peter Korsgaard
