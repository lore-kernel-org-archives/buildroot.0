From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 May 2019 17:03:42 +0200
Subject: [Buildroot] [PATCH] toolchain/toolchain-external-andes-nds32:
 disable static build
In-Reply-To: <a33c8c3ccbb5888c7ff288748bb769d4fa402ce6.1557201262.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 7 May 2019 06:54:22 +0300")
References: <a33c8c3ccbb5888c7ff288748bb769d4fa402ce6.1557201262.git.baruch@tkos.co.il>
Message-ID: <87o94etigh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Buildroot does not support static build with glibc. Since this external
 > toolchain uses glibc, disable static build with this toolchain.

 > Fixes:
 > http://autobuild.buildroot.net/results/3c93cfac81f15f4c18eb7ad578ad86bb7bcf1c12/
 > http://autobuild.buildroot.net/results/63994f51a2b224b66acfafe5b236249d867a507d/
 > http://autobuild.buildroot.net/results/96c3be922a96c50fbd8e68059f9ced8a2a75f9ab/

 > Cc: Nylon Chen <nylon7@andestech.com>
 > Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
