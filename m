From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 05 Jul 2013 15:31:03 +0200
Subject: [Buildroot] [PATCH] gcc: apply PowerPC patch when needed
In-Reply-To: <1373013652-4162-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 5 Jul 2013 10:40:52 +0200")
References: <1373013652-4162-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k3l5jfqg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> When converting gcc to the package infrastructure, a specific thing
 Thomas> for PowerPC was forgotten: applying the conditional patch
 Thomas> powerpc-link-with-math-lib.patch.conditional. This breaks the build of
 Thomas> some PowerPC toolchains, with failures such as:

 Thomas> <http://jenkins.free-electrons.com/job/buildroot/./config=qemu_ppc_virtex_ml507_defconfig/ws/output/host/usr/lib/gcc/powerpc-buildroot-linux-uclibc/4.7.3/../../../../powerpc-buildroot-linux-uclibc/lib/libgcc_s.so.1>: undefined reference to `copysignl'

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
