From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 13 Jan 2009 23:16:56 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libidn
In-Reply-To: <20090113165723.1761476850@busybox.osuosl.org>
	(laird@uclibc.org's message of "Tue\,
	13 Jan 2009 16\:57\:22 +0000 \(UTC\)")
References: <20090113165723.1761476850@busybox.osuosl.org>
Message-ID: <87fxjmdf6v.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "laird" == laird  <laird@uclibc.org> writes:

 laird> Author: laird
 laird> Date: 2009-01-13 16:57:21 +0000 (Tue, 13 Jan 2009)
 laird> New Revision: 24818

 laird> Log:
 laird> package/libidn/Config.in: Fix line length of text

 laird> +++ trunk/buildroot/package/libidn/Config.in	2009-01-13 16:57:21 UTC (rev 24818)
 laird> @@ -2,5 +2,6 @@
 laird>  	bool "libidn"
 laird>  	help
 laird>  	  http://www.gnu.org/software/libidn/
 laird> -	  Libidn's purpose is to encode and decode internationalized domain names. 
 laird> +	  Libidn's purpose is to encode and decode internationalized 
 laird> +	  domain names. 

Please don't add trailing spaces.

-- 
Bye, Peter Korsgaard
