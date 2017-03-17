From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Mar 2017 00:41:49 +0100
Subject: [Buildroot] [PATCH] rpm: bump version to 4.13.0.1 (security)
In-Reply-To: <20170313123120.8847-1-Vincent.Riera@imgtec.com> (Vicente Olivert
 Riera's message of "Mon, 13 Mar 2017 12:31:20 +0000")
References: <20170313123120.8847-1-Vincent.Riera@imgtec.com>
Message-ID: <87o9wzmpxe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Security fixes:
 >  - Fix several out of bounds reads in the OpenPGP parser
 >  - Fix handling of OpenPGP reserved tag (should be rejected)
 >  - Fix various crashes from malformed packages with invalid tags

 > Release notes:
 >   http://rpm.org/wiki/Releases/4.13.0.1

 > This patch also switches from GitHub to rpm.org since the last one seems
 > to be more up-to-date.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
