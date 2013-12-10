From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Dec 2013 10:09:35 +0100
Subject: [Buildroot] [PATCH 2/2] imagemagick: unification of name major
	version variable
In-Reply-To: <1386659915-3798-2-git-send-email-jerzy.grzegorek@trzebnica.net>
 (Jerzy Grzegorek's message of "Tue, 10 Dec 2013 08:18:35 +0100")
References: <1386659915-3798-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <1386659915-3798-2-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <8761qx6pio.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jerzy" == Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net> writes:

 > Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
 > ---
 >  package/imagemagick/imagemagick.mk |    4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
 > index 0af5f0e..c4f6277 100644
 > --- a/package/imagemagick/imagemagick.mk
 > +++ b/package/imagemagick/imagemagick.mk
 > @@ -4,8 +4,8 @@
 >  #
 >  ################################################################################
 
 > -IMAGEMAGICK_MAJOR = 6.8.7
 > -IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-9
 > +IMAGEMAGICK_VERSION_MAJOR = 6.8.7
 > +IMAGEMAGICK_VERSION = $(IMAGEMAGICK_VERSION_MAJOR)-9

The MAJOR variable is only used in the _VERSION specifier, so I simply
got rid of it instead.

-- 
Bye, Peter Korsgaard
