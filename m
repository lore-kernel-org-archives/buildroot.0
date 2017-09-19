From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Sep 2017 21:59:58 +0200
Subject: [Buildroot] [PATCH] xen: add upstream post-4.9.0 security fixes
In-Reply-To: <20170919150314.31745-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 19 Sep 2017 17:03:14 +0200")
References: <20170919150314.31745-1-peter@korsgaard.com>
Message-ID: <87377i1mtd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > XSA-226: multiple problems with transitive grants (CVE-2017-12135)
 > XSA-227: x86: PV privilege escalation via map_grant_ref (CVE-2017-12137)
 > XSA-228: grant_table: Race conditions with maptrack free list handling
 >          (CVE-2017-12136)
 > XSA-230: grant_table: possibly premature clearing of GTF_writing /
 >          GTF_reading (CVE-2017-12855)
 > XSA-231: Missing NUMA node parameter verification (CVE-2017-14316)
 > XSA-232: Missing check for grant table (CVE-2017-14318)
 > XSA-233: cxenstored: Race in domain cleanup (CVE-2017-14317)
 > XSA-234: insufficient grant unmapping checks for x86 PV guests
 >          (CVE-2017-14319)
 > XSA-235: add-to-physmap error paths fail to release lock on ARM

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
