From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Sep 2017 13:57:30 +0200
Subject: [Buildroot] [PATCH-2017.02.x] xen: add upstream post-4.7.3
	security fixes
In-Reply-To: <BLUPR02MB1618A17191645799EDF85160DC630@BLUPR02MB1618.namprd02.prod.outlook.com>
 (Alistair Francis's message of "Mon, 18 Sep 2017 21:37:54 +0000")
References: <20170918154908.2935-1-peter@korsgaard.com>
 <BLUPR02MB1618A17191645799EDF85160DC630@BLUPR02MB1618.namprd02.prod.outlook.com>
Message-ID: <87efr23npx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alistair" == Alistair Francis <alistai@xilinx.com> writes:

 >> -----Original Message-----
 >> From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter
 >> Korsgaard
 >> Sent: Monday, September 18, 2017 8:49 AM
 >> To: buildroot at buildroot.org
 >> Cc: Alistair Francis <alistai@xilinx.com>; Peter Korsgaard
 >> <peter@korsgaard.com>
 >> Subject: [PATCH-2017.02.x] xen: add upstream post-4.7.3 security fixes
 >> 
 >> Fixes the following security issues:
 >> 
 >> XSA-226: multiple problems with transitive grants (CVE-2017-12135)
 >> XSA-227: x86: PV privilege escalation via map_grant_ref (CVE-2017-12137)
 >> XSA-228: grant_table: Race conditions with maptrack free list handling
 >> (CVE-2017-12136)
 >> XSA-230: grant_table: possibly premature clearing of GTF_writing /
 >> GTF_reading (CVE-2017-12855)
 >> XSA-231: Missing NUMA node parameter verification (CVE-2017-14316)
 >> XSA-232: Missing check for grant table (CVE-2017-14318)
 >> XSA-233: cxenstored: Race in domain cleanup (CVE-2017-14317)
 >> XSA-234: insufficient grant unmapping checks for x86 PV guests
 >> (CVE-2017-14319)
 >> XSA-235: add-to-physmap error paths fail to release lock on ARM
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Sorry for the weird email format.

 > This patch looks good to me.

 > Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
