From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Jun 2018 21:10:57 +0200
Subject: [Buildroot] [PATCH] dos2unix: fix static build
In-Reply-To: <b1515512894db829300a9efc2cbc37fb9e029db9.1529864100.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 24 Jun 2018 21:15:00 +0300")
References: <b1515512894db829300a9efc2cbc37fb9e029db9.1529864100.git.baruch@tkos.co.il>
Message-ID: <87in68f1a6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Pass the -static flag to the final link command. Otherwise, the
 > generated executables are not static when the external toolchain
 > provides both shared and static libraries.

 > Should also fix:
 > http://autobuild.buildroot.net/results/a5a/a5a64bc3ff5a91a8680ac52f3505362491923b26/
 > http://autobuild.buildroot.net/results/ebf/ebfe81e65751d7a5ca3aa4e20cc708a24ba65204/

 > Cc: David Bachelart <david.bachelart@bbright.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
