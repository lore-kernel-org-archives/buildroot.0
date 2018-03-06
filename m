From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Mar 2018 11:03:36 +0100
Subject: [Buildroot] [PATCH] musl: drop upstream patch
In-Reply-To: <c953f8543d16ede5bdb9780a99dd3574cd91ba17.1520310732.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 6 Mar 2018 06:32:12 +0200")
References: <c953f8543d16ede5bdb9780a99dd3574cd91ba17.1520310732.git.baruch@tkos.co.il>
Message-ID: <87sh9dr05j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Commit 1296d57918fd2 (musl: bump to version 1.1.19) forgot to remove an
 > upstream patch. Do that now.

 > Fixes:
 > http://autobuild.buildroot.net/results/3ea/3ea23854c501d12aa69012df9d38d33cd10ac83c/

 > Cc: J?rg Krause <joerg.krause@embedded.rocks>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
