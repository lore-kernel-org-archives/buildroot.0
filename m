From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 20:54:13 +0100
Subject: [Buildroot] [PATCH] package/memtester: fix compile and link
 flags
In-Reply-To: <f9ae74a3f5657230a29cb3133d747a77a58ae435.1612775074.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 8 Feb 2021 11:04:34 +0200")
References: <f9ae74a3f5657230a29cb3133d747a77a58ae435.1612775074.git.baruch@tkos.co.il>
Message-ID: <87o8grk8be.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The memtester build system does not use CFLAGS/LDFLAGS variables.
 > Everything should be written to conf-cc and conf-ld.

 > Use '%' as sed expression delimiter because comma might appear in
 > LDFLAGS.

 > Cc: Matt Weber <matthew.weber@rockwellcollins.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
