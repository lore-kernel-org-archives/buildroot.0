From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 13 Mar 2008 19:25:52 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/docs
In-Reply-To: <20080313171631.D6BFF120156@busybox.net> (ninevoltz@uclibc.org's
	message of "Thu\, 13 Mar 2008 10\:16\:31 -0700 \(PDT\)")
References: <20080313171631.D6BFF120156@busybox.net>
Message-ID: <87lk4m5vm7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:

 ninevoltz> Author: ninevoltz
 ninevoltz> Date: 2008-03-13 10:16:30 -0700 (Thu, 13 Mar 2008)
 ninevoltz> New Revision: 21326

 ninevoltz> Log:
 ninevoltz> add some documentation about buildroot's patch system

 ninevoltz> Added:
 ninevoltz>    trunk/buildroot/docs/patches.html


 ninevoltz> Changeset:
 ninevoltz> Added: trunk/buildroot/docs/patches.html
 ninevoltz> ===================================================================
 ninevoltz> --- trunk/buildroot/docs/patches.html	                        (rev 0)
 ninevoltz> +++ trunk/buildroot/docs/patches.html	2008-03-13 17:16:30 UTC (rev 21326)
 ninevoltz> @@ -0,0 +1,43 @@
 ninevoltz> +<!--#include file="header.html" -->
 ninevoltz> +
 ninevoltz> +<h2>Buildroot patch structure</h2>
 ninevoltz> +
 ninevoltz> +<p>
 ninevoltz> +<h4>Keeping track of applied patches</h4>
 ninevoltz> +Whenever a patch is applied to a source code directory in buildroot, a text file named .applied_patches_list is created inside that source directory. 

Please try to keep the lines <80 chars like the rest of the
documentation.

-- 
Bye, Peter Korsgaard
