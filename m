From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Jan 2015 23:59:28 +0100
Subject: [Buildroot] [PATCH] rt-tests: fix build dependencies
In-Reply-To: <917c1645d4d4c0d3729547bb34f06781c93af523.1422214834.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 25 Jan 2015 21:40:34 +0200")
References: <917c1645d4d4c0d3729547bb34f06781c93af523.1422214834.git.baruch@tkos.co.il>
Message-ID: <87pp9zx227.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Some tests didn't list librttest in their dependencies.
 > Fixes:
 > http://autobuild.buildroot.net/results/999/9998dcf8c82989d9eba772e16ce3905b24badbfc/
 > http://autobuild.buildroot.net/results/b1e/b1e078591d65a3b5c9d638ad5bbb4ec8c28c38ef/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
