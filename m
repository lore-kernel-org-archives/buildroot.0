From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Feb 2018 09:09:49 +0100
Subject: [Buildroot] [PATCH] patch: security bump to version 2.7.6
In-Reply-To: <e16723b54e63c62981c659f83eb6991853bf529a.1519363351.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 23 Feb 2018 07:22:31 +0200")
References: <e16723b54e63c62981c659f83eb6991853bf529a.1519363351.git.baruch@tkos.co.il>
Message-ID: <87woz4p1o2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2016-10713: Out-of-bounds access within pch_write_line() in
 > pch.c can possibly lead to DoS via a crafted input file.

 > Add upstream patch fixing CVE-2018-6951: There is a segmentation fault,
 > associated with a NULL pointer dereference, leading to a denial of
 > service in the intuit_diff_type function in pch.c, aka a "mangled
 > rename" issue.

 > This bump does NOT fix CVE-2018-6952. See upstream bug #53133
 > (https://savannah.gnu.org/bugs/index.php?53133).

 > Add license file hash.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
