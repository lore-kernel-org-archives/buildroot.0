From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 13 Jan 2009 23:16:10 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libidn
In-Reply-To: <20090113163618.02A6D76850@busybox.osuosl.org>
	(laird@uclibc.org's message of "Tue\,
	13 Jan 2009 16\:36\:17 +0000 \(UTC\)")
References: <20090113163618.02A6D76850@busybox.osuosl.org>
Message-ID: <87k58ydf85.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "laird" == laird  <laird@uclibc.org> writes:

 laird> Author: laird
 laird> Date: 2009-01-13 16:36:16 +0000 (Tue, 13 Jan 2009)
 laird> New Revision: 24817

 laird> Log:
 laird> package/libidn: Add a new package (required by later WebKits...)

 laird> +config BR2_PACKAGE_LIBIDN
 laird> +	bool "libidn"
 laird> +	help
 laird> +	  http://www.gnu.org/software/libidn/
 laird> +	  Libidn's purpose is to encode and decode internationalized domain names. 

We normally structure the help text as:

<Description>
<empty line>
<Homepage>

Could you please do so as well?

-- 
Bye, Peter Korsgaard
