From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Sep 2015 23:46:31 +0200
Subject: [Buildroot] [PATCHv4 2/2] udisks: fix build with newer glibc
	versions
In-Reply-To: <1441203680-29193-2-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Wed, 2 Sep 2015 15:21:20 +0100")
References: <1441203680-29193-1-git-send-email-Vincent.Riera@imgtec.com>
 <1441203680-29193-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87wpw1j420.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Backport an upstream patch to fix the build with newer glibc versions.
 > This is how the failure looks like:

 > job-drive-detach.c: In function 'sysfs_exists':
 > job-drive-detach.c:44:15: error: storage size of 'statbuf' isn't known
 >    struct stat statbuf;

 > Fixes:

 >   http://autobuild.buildroot.net/results/ab3/ab36c2a1d2ca41a4d9ec6bab7d8d45678dbc5dcd/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
