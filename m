From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Mar 2021 16:43:34 +0100
Subject: [Buildroot] [PATCH 2/2] package/asterisk: fix build failure due
 to gcc bug 93847
In-Reply-To: <20210305091102.2420944-3-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Fri, 5 Mar 2021 10:11:02 +0100")
References: <20210305091102.2420944-1-giulio.benetti@benettiengineering.com>
 <20210305091102.2420944-3-giulio.benetti@benettiengineering.com>
Message-ID: <87lfb08ezd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > The asterisk package exhibits gcc bug 93847 when built for the Nios2
 > architecture with optimization enabled, which causes a build failure.

 > As done for other packages in Buildroot work around this gcc bug by
 > setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_93847=y.

 > Fixes:
 > http://autobuild.buildroot.net/results/24c0a6ca3b272711a1e6ceaa033925182d0d49c4

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
