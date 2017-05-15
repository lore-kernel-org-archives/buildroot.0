From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 13:37:59 +0200
Subject: [Buildroot] [PATCH master] postgresql: bump version to 9.6.3
	(security)
In-Reply-To: <20170511142014.20027-1-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Thu, 11 May 2017 15:20:14 +0100")
References: <20170511142014.20027-1-Vincent.Riera@imgtec.com>
Message-ID: <87r2zqjqp4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Three security vulnerabilities have been closed by this release:
 > CVE-2017-7484: selectivity estimators bypass SELECT privilege checks
 > CVE-2017-7485: libpq ignores PGREQUIRESSL environment variable
 > CVE-2017-7486: pg_user_mappings view discloses foreign server passwords

 > More details: https://www.postgresql.org/about/news/1746/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
