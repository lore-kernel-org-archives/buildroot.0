From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 14:08:23 +0100
Subject: [Buildroot] [PATCH] coreutils: disable documentation build
In-Reply-To: <6eb52607527cefc15203eb26da99044fe6c6e3cd.1416306516.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 18 Nov 2014 12:28:36 +0200")
References: <6eb52607527cefc15203eb26da99044fe6c6e3cd.1416306516.git.baruch@tkos.co.il>
Message-ID: <877fysr708.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The makeinfo utility may not be installed on the build machine, and we don't
 > install documentation anyway.

 > Fixes:
 > http://autobuild.buildroot.net/results/b42/b42ceb3128ed832f0dd901a1db8fa3dfd92ce5ef/
 > http://autobuild.buildroot.net/results/94f/94fcd06b320374f46b340f516c54b7ca726041af/
 > http://autobuild.buildroot.net/results/c54/c54608ac7e03f14055e2912cf06f6d41d21227c0/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
