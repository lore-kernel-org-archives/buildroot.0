From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Jun 2016 16:48:45 +0200
Subject: [Buildroot] [PATCH] dhcpcd: security bump to version 6.11.0
In-Reply-To: <08707bcba18646793e382a354c2cfed2b98a6689.1465911207.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 14 Jun 2016 16:33:27 +0300")
References: <08707bcba18646793e382a354c2cfed2b98a6689.1465911207.git.baruch@tkos.co.il>
Message-ID: <87a8inx1v6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2014-7913: The print_option function in dhcp-common.c in dhcpcd
 > through 6.10.2 misinterprets the return value of the snprintf function, which
 > allows remote DHCP servers to execute arbitrary code or cause a denial of
 > service (memory corruption) via a crafted message.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
