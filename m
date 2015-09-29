From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Sep 2015 00:30:40 +0200
Subject: [Buildroot] [PATCH] ipmiutil: needs dynamic library support
In-Reply-To: <83a0afc5c996ee536aaae2e182eeae4393fd83e2.1443523281.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 29 Sep 2015 13:41:21 +0300")
References: <83a0afc5c996ee536aaae2e182eeae4393fd83e2.1443523281.git.baruch@tkos.co.il>
Message-ID: <87wpv8yi27.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > ipmiutil builds libipmiutil.so unconditionally.
 > Fixes:
 > http://autobuild.buildroot.net/results/e31/e31d94847cad9216aad839c2fbb312e9ea0ae75e/
 > http://autobuild.buildroot.net/results/5f3/5f3f32473186e6fa3a165b263f682047af8e291e/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
