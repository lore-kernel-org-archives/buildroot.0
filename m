From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Mar 2021 23:42:05 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/protobuf: disable package if
 binutils is affected from bug 21464
In-Reply-To: <20210305161211.4396-3-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Fri, 5 Mar 2021 17:12:10 +0100")
References: <20210305161211.4396-1-giulio.benetti@benettiengineering.com>
 <20210305161211.4396-3-giulio.benetti@benettiengineering.com>
Message-ID: <87im5lqwg2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > This package is affected from binutils bug 21464, since there is no
 > workaround, let's disable it.

 > Fixes:
 > http://autobuild.buildroot.net/results/908/9084cd777aefe0fa8235514c33767d8640ad7a5b/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
