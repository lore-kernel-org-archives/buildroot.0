From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Nov 2014 14:13:26 +0100
Subject: [Buildroot] [PATCH 1/2] connman: disable for static builds
In-Reply-To: <1415620348-2754-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Mon, 10 Nov 2014 11:52:27 +0000")
References: <1415620348-2754-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87sihrnqq1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > It needs dlopen(), otherwise it will fail at the configure phase with a
 > message like this one:

 > checking for dlopen in -ldl... no
 > configure: error: dynamic linking loader is required

 > Fixes:
 >   http://autobuild.buildroot.net/results/647/64742a1d3a07f86a7c801da5ef30892c1f760031/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
