From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Feb 2014 23:13:37 +0100
Subject: [Buildroot] [PATCH] open2300: fix build failure
In-Reply-To: <1391719776-3209-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Thu, 6 Feb 2014 21:49:36 +0100")
References: <1391719776-3209-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87zjm3lwj2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > This patch fixes the open2300's build-system, which is a handwritten
 > Makefile, by removing the hard-coded include and library locations and
 > making them pointing to the systroot.

 > Fixes:
 >   http://autobuild.buildroot.org/results/072/0724ffa1355f5564b1fcd9d6e3c9ff2162d20f44/build-end.log

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

Please don't forget to mark updated patches as such (E.G. PATCHv2).

-- 
Bye, Peter Korsgaard
