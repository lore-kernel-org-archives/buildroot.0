From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Jul 2018 21:52:14 +0200
Subject: [Buildroot] [PATCH] bind: security bump to 9.11.4
In-Reply-To: <410dbec2b2ba1d7f56dcd2381b482ebdb1371d10.1531827174.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 17 Jul 2018 14:32:54 +0300")
References: <410dbec2b2ba1d7f56dcd2381b482ebdb1371d10.1531827174.git.baruch@tkos.co.il>
Message-ID: <874lgxljwx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2018-5738: When recursion is enabled but the allow-recursion
 > and allow-query-cache ACLs are not specified, they should be limited to
 > local networks, but they were inadvertently set to match the default
 > allow-query, thus allowing remote queries.

 > Update license file hash; copyright year update.

 > Add reference to tarball signature key.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
