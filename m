From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Mar 2021 16:47:34 +0100
Subject: [Buildroot] [PATCH 2/2] package/belle-sip: fix build failure
 due to gcc bug 99410
In-Reply-To: <20210305151529.3477575-3-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Fri, 5 Mar 2021 16:15:29 +0100")
References: <20210305151529.3477575-1-giulio.benetti@benettiengineering.com>
 <20210305151529.3477575-3-giulio.benetti@benettiengineering.com>
Message-ID: <87czwc8esp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > The belle-sip package exhibits gcc bug 99410 when built for the Nios2
 > architecture with optimization enabled, which causes a build failure.

 > As done for other packages in Buildroot work around this gcc bug by
 > setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_99410=y.

 > Fixes:
 > http://autobuild.buildroot.net/results/71f26fd81db8e9b19b3f18f3f3cefd9c768f094f/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
