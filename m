From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Nov 2020 14:24:14 +0100
Subject: [Buildroot] [PATCH 2020.08.x] package/busybox: Fix hwclock for
 glibc 2.31+
In-Reply-To: <20201113123917.22425-1-klaus@linux.vnet.ibm.com> (Klaus Heinrich
 Kiwi's message of "Fri, 13 Nov 2020 09:39:17 -0300")
References: <20201113123917.22425-1-klaus@linux.vnet.ibm.com>
Message-ID: <877dqm92ip.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Klaus" == Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com> writes:

 > Pick the below patch from upstream, in order to fix
 > 'settimeofday: Invalid argument' introduced by using glibc v2.31+.
 > (upstream fix 8b4b928 with a small change to apply on busybox 1.31.1)

 > See https://bugs.busybox.net/show_bug.cgi?id=12756 for more info.

 > Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

Committed to 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
