From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 May 2019 15:59:14 +0200
Subject: [Buildroot] [PATCH v2] package/strace: disable bpf support for
 m68k
In-Reply-To: <d10e11cd2b915958286cf09efc470beb80c8ccb0.1557435002.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 9 May 2019 23:50:02 +0300")
References: <d10e11cd2b915958286cf09efc470beb80c8ccb0.1557435002.git.baruch@tkos.co.il>
Message-ID: <875zqiqukt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Mismatch in struct bpf_prog_info fields offset between kernel headers
 > and strace local definition causes build failure. Disable bpf support
 > for m68k until upstream (either strace or the kernel) find a solution.

 > https://lists.strace.io/pipermail/strace-devel/2019-May/thread.html#8750

 > Fixes:
 > http://autobuild.buildroot.net/results/c036b11bf1f2fc39f42661634ef3e03360fb85de/
 > http://autobuild.buildroot.net/results/f142e4c7f0d512bb872572f5e678230117ab0ad5/
 > http://autobuild.buildroot.net/results/b74a17cfa7112c026938cacafdd18c6dca285005/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v2: Only disable bpf support; add Fixes tag

Committed, thanks.

-- 
Bye, Peter Korsgaard
