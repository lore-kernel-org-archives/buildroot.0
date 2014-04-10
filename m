From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Apr 2014 23:17:32 +0200
Subject: [Buildroot] [PATCH 2/2] liblogging: Depend on systemd
In-Reply-To: <1397145566-11243-2-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Thu, 10 Apr 2014 16:59:26 +0100")
References: <1397145566-11243-1-git-send-email-Vincent.Riera@imgtec.com>
 <1397145566-11243-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87ppko6g0j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > This package depends on systemd because in the configure phase it
 > searches for a file installed by systemd. We add systemd to it's
 > dependencies to ensure that is built before this package.

 > Fixes:
 >    http://autobuild.buildroot.net/results/32c/32c636020600aa3f378d326c84fac82eb1fb2871/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
