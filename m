From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 Jan 2009 22:02:00 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/popt
In-Reply-To: <20090125205100.1BBE176D28@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sun\, 25 Jan 2009 20\:50\:59 +0000 \(UTC\)")
References: <20090125205100.1BBE176D28@busybox.osuosl.org>
Message-ID: <87ljszdrqv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-25 20:50:59 +0000 (Sun, 25 Jan 2009)
 ulf> New Revision: 25019

 ulf> Log:
 ulf> Support libiconv option for popt

 ulf> Modified:
 ulf>    trunk/buildroot/package/popt/popt.mk


 ulf> Changeset:
 ulf> Modified: trunk/buildroot/package/popt/popt.mk
 ulf> ===================================================================
 ulf> --- trunk/buildroot/package/popt/popt.mk	2009-01-25 20:44:23 UTC (rev 25018)
 ulf> +++ trunk/buildroot/package/popt/popt.mk	2009-01-25 20:50:59 UTC (rev 25019)
 ulf> @@ -5,10 +5,16 @@
 ulf>  #############################################################
 ulf>  POPT_VERSION:=1.14
 ulf>  POPT_SITE:=http://rpm5.org/files/popt
 ulf> -POPT_INSTALL_STAGING:=YES
 ulf> -POPT_INSTALL_TARGET:=YES
 ulf> -POPT_CONF_ENV:=ac_cv_va_copy=yes
 ulf> +POPT_INSTALL_STAGING = YES
 ulf> +POPT_INSTALL_TARGET = YES

What's wrong with := ?

-- 
Bye, Peter Korsgaard
