From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Nov 2016 23:26:09 +0100
Subject: [Buildroot] [PATCH] jasper: bump version to 1.900.31 (security)
In-Reply-To: <20161129112303.37568-1-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Tue, 29 Nov 2016 11:23:03 +0000")
References: <20161129112303.37568-1-Vincent.Riera@imgtec.com>
Message-ID: <87lgw1dita.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Fixed CVEs:
 >  - CVE-2016-9387
 >  - CVE-2016-9388
 >  - CVE-2016-9389
 >  - CVE-2016-9390
 >  - CVE-2016-9391
 >  - CVE-2016-9392
 >  - CVE-2016-9393
 >  - CVE-2016-9394
 >  - CVE-2016-9395
 >  - CVE-2016-9396
 >  - CVE-2016-9397
 >  - CVE-2016-9398
 >  - CVE-2016-9399
 >  - CVE-2016-9557
 >  - CVE-2016-9560

 > Changes to jasper.mk:
 >  - Switched site method to GitHub. 1.900.31 is not released as a tarball
 >    in the official website.
 >  - Autoreconf necessary since there isn't any configure script. We need
 >    to generate it.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
