From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Jan 2019 23:31:10 +0100
Subject: [Buildroot] [PATCH] libssh: fix some -Werror=strict-overflow
 build failures
In-Reply-To: <f456366db1999e58a7649ab5880b92d05ef1e604.1548158285.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 22 Jan 2019 13:58:05 +0200")
References: <f456366db1999e58a7649ab5880b92d05ef1e604.1548158285.git.baruch@tkos.co.il>
Message-ID: <87d0oomij5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add fixes for some of the build failures caused by strict-overflow
 > warnings. Patches #1, #2, and #4 are upstream. Patch #3 is pending
 > upstream.

 > Fixes:
 > http://autobuild.buildroot.net/results/923/9239f230629ca4e381af5e8f43989997d9bfde99/
 > http://autobuild.buildroot.net/results/618/6187b92bcdfd9281683c37906ae74f2e0c5e6d0e/
 > http://autobuild.buildroot.net/results/9eb/9eb5ed92a923f0c038e3d913289eddc1cda1b62f/

 > Cc: Scott Fan <fancp2007@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
