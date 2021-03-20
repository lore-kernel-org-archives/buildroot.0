From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Mar 2021 23:41:58 +0100
Subject: [Buildroot] [PATCH v2 1/3] toolchain: introduce
 BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
In-Reply-To: <20210305161211.4396-2-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Fri, 5 Mar 2021 17:12:09 +0100")
References: <20210305161211.4396-1-giulio.benetti@benettiengineering.com>
 <20210305161211.4396-2-giulio.benetti@benettiengineering.com>
Message-ID: <87mtuxqwg9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > On OpenRisc binutils it still present ld bug 21464 leading to a package
 > protobuf to fail building:
 > http://autobuild.buildroot.net/results/908/9084cd777aefe0fa8235514c33767d8640ad7a5b/

 > The bug was already reported and it's been updated:
 > https://sourceware.org/bugzilla/show_bug.cgi?id=21464

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
