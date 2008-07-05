From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 Jul 2008 21:08:36 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
In-Reply-To: <20080704025714.5B6BE3C65A@busybox.net> (correa@uclibc.org's
	message of "Thu\, 3 Jul 2008 19\:57\:14 -0700 \(PDT\)")
References: <20080704025714.5B6BE3C65A@busybox.net>
Message-ID: <87k5g0i1xn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "correa" == correa  <correa@uclibc.org> writes:

 correa> Author: correa
 correa> Date: 2008-07-03 19:57:13 -0700 (Thu, 03 Jul 2008)
 correa> New Revision: 22622

 correa> Log:
 correa> Fix freetype-2.2.1 build in AVR32, possibly other platforms too

 correa> Modified:
 correa>    trunk/buildroot/package/freetype/freetype.mk
 
 correa>  $(FREETYPE_DIR)/.configured: $(FREETYPE_DIR)/.unpacked
 correa> -	(cd $(FREETYPE_DIR) && \
 correa> +	(cd $(FREETYPE_DIR);  rm -rf config.cache; \

Why rm -r ?

-- 
Bye, Peter Korsgaard
