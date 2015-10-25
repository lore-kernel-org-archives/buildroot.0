From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 23:19:45 +0100
Subject: [Buildroot] [PATCH v2] openpgm: bump to version release-5-2-122
In-Reply-To: <1445443524-50754-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Wed, 21 Oct 2015 17:05:24 +0100")
References: <1445443524-50754-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87fv0yegla.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > At the same time perform a GitHub migration, since Google Code will
 > disappear soon.

 > - Bump to version release-5-2-122
 > - Switch to GitHub
 > - Remove trailing slash from OPENPGM_SUBDIR
 > - Remove unnecessary python dependencies
 > - Add a hook to create the missing m4 directory, needed to autoreconf
 > - Add a hash file
 > - Rewrap the help text to 72 characters length
 > - Change the project URL

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 > Changes v1 -> v2:
 >   - Remove the hook for running the bootstrap script
 >   - Re-add AUTORECONF = YES
 >   - Add a hook to create the missing m4 directory, needed to autoreconf

Committed, thanks.

-- 
Bye, Peter Korsgaard
