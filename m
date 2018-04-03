From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Apr 2018 22:51:04 +0200
Subject: [Buildroot] [PATCH] libbsd: fix build for openrisc with uClibc
In-Reply-To: <399872a6c84372d78d1ed93e337d2e858456610b.1522782302.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 3 Apr 2018 22:05:02 +0300")
References: <399872a6c84372d78d1ed93e337d2e858456610b.1522782302.git.baruch@tkos.co.il>
Message-ID: <87y3i4nhdz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Commit d879be30495 (package/libbsd: enable for non-glibc toolchains)
 > enabled libbsd for openrisc. Unfortunately uClibc does not define the
 > EM_OPENRISC macro that libbsd expects for ELF e_machine ID. Add patch
 > making libbsd fallback to the equivalent EM_OR1K macro that uClibc does
 > provide.

 > Fixes:
 > http://autobuild.buildroot.net/results/2f5/2f51eebe5964e8f1be3ecd2032e7d7837bf98b84/

 > Cc: Waldemar Brodkorb <wbx@openadk.org>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: J?rg Krause <joerg.krause@embedded.rocks>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
