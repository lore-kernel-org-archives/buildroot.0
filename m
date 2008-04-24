From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Apr 2008 15:53:38 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/xstroke
In-Reply-To: <20080424132329.0B95B3C863@busybox.net> (ninevoltz@uclibc.org's
	message of "Thu\, 24 Apr 2008 06\:23\:29 -0700 \(PDT\)")
References: <20080424132329.0B95B3C863@busybox.net>
Message-ID: <87ej8v5pgd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:

 ninevoltz> Author: ninevoltz
 ninevoltz> Date: 2008-04-24 06:23:28 -0700 (Thu, 24 Apr 2008)
 ninevoltz> New Revision: 21838

 ninevoltz> Log:
 ninevoltz> select docker with xstroke so xstroke has a place to live

 ninevoltz> -XSTROKE_DEPENDENCIES = uclibc docker
 ninevoltz> +XSTROKE_DEPENDENCIES = uclibc 

Trailing space.

-- 
Bye, Peter Korsgaard
