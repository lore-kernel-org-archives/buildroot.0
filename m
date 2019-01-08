From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Jan 2019 21:09:31 +0100
Subject: [Buildroot] [PATCH] package/strace: fix build for mips
In-Reply-To: <133b0ce8571112098cd9ff308d10326b32df24dc.1546970888.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 8 Jan 2019 20:08:08 +0200")
References: <133b0ce8571112098cd9ff308d10326b32df24dc.1546970888.git.baruch@tkos.co.il>
Message-ID: <874laiud1g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Upstream changes in mips specific code of the last release broke build
 > for that target. Add a patch that restores build.

 > Fixes:
 > http://autobuild.buildroot.net/results/858/8585e75df6462b6d07476a81982e88ec81655c8b/
 > http://autobuild.buildroot.net/results/b2f/b2f24976ddda1adc9b9ba3d9bfb7167721814f78/
 > http://autobuild.buildroot.net/results/031/0313245fe555e0c0890c3f475bf6586db23535ed/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
