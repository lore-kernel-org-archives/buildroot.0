From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Apr 2008 20:09:51 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  pcre
In-Reply-To: <20080424165606.555523C7F7@busybox.net> (ninevoltz@uclibc.org's
	message of "Thu\, 24 Apr 2008 09\:56\:06 -0700 \(PDT\)")
References: <20080424165606.555523C7F7@busybox.net>
Message-ID: <87ve272kgg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:

 ninevoltz> Author: ninevoltz
 ninevoltz> Date: 2008-04-24 09:56:06 -0700 (Thu, 24 Apr 2008)
 ninevoltz> New Revision: 21848

 ninevoltz> Log:
 ninevoltz> add pcre

 ninevoltz> +#############################################################
 ninevoltz> +#
 ninevoltz> +# PCRE
 ninevoltz> +#
 ninevoltz> +#############################################################
 ninevoltz> +PCRE_VERSION = 7.6
 ninevoltz> +PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
 ninevoltz> +PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
 ninevoltz> +PCRE_INSTALL_STAGING = YES
 ninevoltz> +PCRE_INSTALL_TARGET = YES
 ninevoltz> +
 ninevoltz> +PCRE_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
 ninevoltz> +        --build=$(GNU_HOST_NAME) --prefix=/usr \
 ninevoltz> +        --includedir=/usr/include

Is --includedir needed?


-- 
Bye, Peter Korsgaard
