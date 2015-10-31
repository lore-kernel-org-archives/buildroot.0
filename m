From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Oct 2015 10:02:19 +0100
Subject: [Buildroot] [PATCH] sudo: fix -fstack-protector detection
In-Reply-To: <1446221135-10180-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Fri, 30 Oct 2015 16:05:35 +0000")
References: <1446221135-10180-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87a8qz1kdg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Backport a patch series from upstream to fix the configure check for
 > -fstack-protector.

 > Fixes:
 >   http://autobuild.buildroot.net/results/bdd3e5352aa283b96717202a794f9762d15cc736/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
