From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Sep 2014 22:33:53 +0200
Subject: [Buildroot] [PATCH v2] keyutils: Bump version to 1.5.9,
	fix patches and
In-Reply-To: <1411548259-6866-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Wed, 24 Sep 2014 09:44:19 +0100")
References: <1411548259-6866-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87d2aftrgu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > - Bump version to 1.5.9
 > - Remove patches already included in this version
 > - Use make parameters instead of environment variables
 > - Add an upstream patch to fix building statically
 > - Adapt old patches to the new version
 > - Add a hash file

 > Fixes:
 >   http://autobuild.buildroot.net/results/ced/ced596bd1c73286f7044f5a8e11b6588fc973f11/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
