From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 25 Sep 2014 11:01:44 +0200
Subject: [Buildroot] [PATCH] ncurses: Add libcurses symlink to libncurses
In-Reply-To: <1411464791-8023-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Tue, 23 Sep 2014 10:33:11 +0100")
References: <1411464791-8023-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87wq8sysxz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Some packages use -lcurses when they are linking, so they try to link to
 > a library called libcurses. The library provided by our ncurses package
 > is called libncurses, so those packages fail to link with a message like
 > this one:

 > /bin/ld: cannot find -lcurses

 > Installing a libcurses symlink to libncurses fixes the problem.

 > Fixes:
 >   http://autobuild.buildroot.net/results/466/466995f9534447a4f54327a14c44ef9e16dd1123/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
