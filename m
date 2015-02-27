From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Feb 2015 14:47:24 +0100
Subject: [Buildroot] [PATCH] gnupg2: security bump to version 2.0.27
In-Reply-To: <ec6dbcb67f0991bd436814cba72f677695cba5a4.1425038892.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 27 Feb 2015 14:08:12 +0200")
References: <ec6dbcb67f0991bd436814cba72f677695cba5a4.1425038892.git.baruch@tkos.co.il>
Message-ID: <87fv9r31qr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes:
 > CVE-2015-1606: Use after free, resulting from failure to skip invalid packets

 > CVE-2015-1607: memcpy with overlapping ranges, resulting from incorrect
 > bitwise left shifts

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
