From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Jun 2018 16:29:52 +0200
Subject: [Buildroot] [PATCH] trinity: fix build with kernel headers
 v4.17+
In-Reply-To: <57101a03a5f14bf5f213424f34826197e3dddf38.1528427782.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 8 Jun 2018 06:16:22 +0300")
References: <57101a03a5f14bf5f213424f34826197e3dddf38.1528427782.git.baruch@tkos.co.il>
Message-ID: <87vaatbbbz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Kernel v4.17 removed the linux/irda.h header. Add a patch to skip the
 > irda test when the header is missing.

 > Fixes:
 > http://autobuild.buildroot.net/results/39d/39d131048d6eb3cd4d802dae462116f7728c41fd/
 > http://autobuild.buildroot.net/results/af2/af2288711d1a0939a06ea51e65ed32d39e395e2b/
 > http://autobuild.buildroot.net/results/41f/41fead6d53dba2539ba246f682973e0b5967f3d0/

 > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
