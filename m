From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 07 Mar 2008 14:30:51 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
In-Reply-To: <20080306181915.D86B5120244@busybox.net> (ninevoltz@uclibc.org's
	message of "Thu\, 6 Mar 2008 10\:19\:15 -0800 \(PST\)")
References: <20080306181915.D86B5120244@busybox.net>
Message-ID: <87d4q6acfo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:

 ninevoltz> Author: ninevoltz
 ninevoltz> Date: 2008-03-06 10:19:15 -0800 (Thu, 06 Mar 2008)
 ninevoltz> New Revision: 21215

 ninevoltz> Log:
 ninevoltz> updated ncurses makefile

This seems totally fubar'ed. It now installs .a files under TARGET_DIR
and usr/share/terminfo is over 6MB!

Please fix otherwise I'll revert the commit.

-- 
Bye, Peter Korsgaard
