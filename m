From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Nov 2017 10:50:52 +0100
Subject: [Buildroot] [PATCH v1] localedef: fix xlocale.h related compile
 failure
In-Reply-To: <20171120183658.3851-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Mon, 20 Nov 2017 19:36:58 +0100")
References: <20171120183658.3851-1-ps.report@gmx.net>
Message-ID: <87po84aw3n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add upstream patch 'Don't include <xlocale.h>'.
 > Fixes Bug-10501 ([1]):

 > In file included from ./include/locale.h:1:0,
 >                  from /usr/include/libintl.h:103,
 >                  from ./include/libintl.h:2,
 >                  from glibc/locale/programs/charmap.c:25:
 > glibc/locale/locale.h:146:11: fatal error: xlocale.h: No such file or directory
 >  # include <xlocale.h>

 > [1] https://bugs.busybox.net/show_bug.cgi?id=10501

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2017.02.x and 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
