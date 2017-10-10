From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Oct 2017 22:04:05 +0200
Subject: [Buildroot] [PATCH 1/2] lvm2: disable selinux for host
In-Reply-To: <dd465954531e2cfa6d0ca76ece7b6384f642ea59.1507663815.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 10 Oct 2017 22:30:14 +0300")
References: <dd465954531e2cfa6d0ca76ece7b6384f642ea59.1507663815.git.baruch@tkos.co.il>
Message-ID: <87efqaepmy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > There is no need for selinux support in the host lvm2 package.
 > Should fix:
 > http://autobuild.buildroot.net/results/6cd/6cde658da1fa815c157acf36b39c10a8d885e9a9/
 > http://autobuild.buildroot.net/results/430/43071433814a3176256687720c1d665f41748484/
 > http://autobuild.buildroot.net/results/ced/cedd7ff4b287d7b71612134444964dc847cc6062/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
