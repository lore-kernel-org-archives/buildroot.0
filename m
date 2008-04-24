From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Apr 2008 19:43:47 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/java: classpath
	concierge jamvm
In-Reply-To: <20080424164821.800223C7C2@busybox.net> (ninevoltz@uclibc.org's
	message of "Thu\, 24 Apr 2008 09\:48\:21 -0700 \(PDT\)")
References: <20080424164821.800223C7C2@busybox.net>
Message-ID: <874p9r408c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:

Hi,

 ninevoltz> Author: ninevoltz
 ninevoltz> Date: 2008-04-24 09:48:20 -0700 (Thu, 24 Apr 2008)
 ninevoltz> New Revision: 21845

 ninevoltz> Log:
 ninevoltz> bump to 0.97.1, removed patch as it has been already applied in upstream revision 0.97.0 (http://gcc.gnu.org/bugzilla/buglist.cgi?product=classpath&target_milestone=0.97)
 ninevoltz> also fix change in package path that prevented patches from being applied

Thanks.

 ninevoltz> +JAMVM_DIR_PREFIX = package/java
 
 ninevoltz> -$(eval $(call AUTOTARGETS,package,jamvm))
 ninevoltz> +$(eval $(call AUTOTARGETS,package/java,jamvm))

Wouldn't it make sense for <package>_DIR_PREFIX to default to the 1st
argument of AUTOTARGETS?

-- 
Bye, Peter Korsgaard
