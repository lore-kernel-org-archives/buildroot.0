From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 23:31:39 +0200
Subject: [Buildroot] [PATCH] openssh: bump to version 7.9p1
In-Reply-To: <06882d5028be809e026e5ef1f934b4b984e7fb38.1540142884.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 21 Oct 2018 20:28:04 +0300")
References: <06882d5028be809e026e5ef1f934b4b984e7fb38.1540142884.git.baruch@tkos.co.il>
Message-ID: <87pnw33s1w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Drop patch #1. uClibc no longer includes pthreads.h indirectly.
 > Drop patch #2. The sys/param.h header is included indirectly through the
 > local includes.h header since version 6.8p1.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
