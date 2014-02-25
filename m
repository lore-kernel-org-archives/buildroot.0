From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Feb 2014 21:00:13 +0100
Subject: [Buildroot] [PATCH] gst1-plugins-bad: select all opencv modules
	needed
In-Reply-To: <1393342604-48284-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Tue, 25 Feb 2014 15:36:44 +0000")
References: <1393342604-48284-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87fvn7j73m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > gstopencv.c includes the old-style header opencv/cv.h which includes a
 > set of module's headers. To satisfy the opencv/cv.h requirements we need
 > to select the modules which provide the required headers.

 > Fixes:
 >    http://autobuild.buildroot.net/results/f5b/f5b248eb7be38d6eb3655cdc1ab6ee5e716b9b29/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
