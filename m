From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 13 Sep 2014 22:23:03 +0200
Subject: [Buildroot] [PATCH] openssh: Add patch to fix compilation with
	musl libc
In-Reply-To: <1410542254-13450-1-git-send-email-maarten@treewalker.org>
 (Maarten ter Huurne's message of "Fri, 12 Sep 2014 19:17:34 +0200")
References: <20140912093559.52c06209@free-electrons.com>
 <1410542254-13450-1-git-send-email-maarten@treewalker.org>
Message-ID: <87wq976ziw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maarten" == Maarten ter Huurne <maarten@treewalker.org> writes:

 > The configure script finds the "howmany" macro, but some of the sources
 > using it do not include the required <sys/param.h> header.

 > Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
