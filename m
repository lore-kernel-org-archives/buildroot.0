From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 14:39:06 +0100
Subject: [Buildroot] [PATCH 1/1] open-lldp: requires dynamic linking
 interface (dlopen, ...)
In-Reply-To: <20180129124530.25241-1-laurent_pubs@yahoo.com> (Laurent
 Charpentier's message of "Mon, 29 Jan 2018 13:45:30 +0100")
References: <20180129124530.25241-1-laurent_pubs@yahoo.com>
Message-ID: <87vafk7pj9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Laurent" == Laurent Charpentier <laurent_pubs@yahoo.com> writes:

 > This patch is to fix the following build error:
 > weak_readline.c:30:19: fatal error: dlfcn.h: No such file or directory
 >  #include <dlfcn.h>
 >                    ^
 > compilation terminated.
 > Makefile:890: recipe for target 'weak_readline.o' failed

 > http://autobuild.buildroot.net/results/516456c8e21759e1ecee4ef9f9689a8f720ecd90/build-end.log

 > Signed-off-by: Laurent Charpentier <laurent_pubs@yahoo.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
