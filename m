From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Nov 2014 13:42:33 +0100
Subject: [Buildroot] [PATCH] gptfdisk: fix static build
In-Reply-To: <e6d964131043e682bac06c3e59dddbfd2d0e5de0.1416916626.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 25 Nov 2014 13:57:06 +0200")
References: <e6d964131043e682bac06c3e59dddbfd2d0e5de0.1416916626.git.baruch@tkos.co.il>
Message-ID: <87ppcbsb7q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > libuuid may need -lintl. Augment the existing Makefile patch to support adding
 > link dependencies at build time.

 > Fixes:
 > http://autobuild.buildroot.net/results/24b/24b3f707424e2dcf0158ffe93d728be98ff66701/
 > http://autobuild.buildroot.net/results/f33/f3359fab166cf3627f15e59fa44cff36ee213102/
 > http://autobuild.buildroot.net/results/ef7/ef783e3776f25c28ea0de0c082c93f7ab97db56d/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
