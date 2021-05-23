From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 May 2021 19:55:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/libraw: depends on
 BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <20210520064729.154411-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 20 May 2021 08:47:29 +0200")
References: <20210520064729.154411-1-fontaine.fabrice@gmail.com>
Message-ID: <87bl915o87.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libraw needs __sync_fetch_and_add since version 0.20.0 and
 > https://github.com/LibRaw/LibRaw/commit/d1975cb0e055d2bfe58c9d845c9a3e57c346a2f9

 > This will fix the following build failure with imagemagick which is
 > raised since commit 2f47cfade4b298350d056f6d9a7525b837e2ba23:

 > /home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libraw_r.so: undefined reference to `__sync_fetch_and_add_4'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/900df43bd418d2da0c3ec875db1c5564dd857e94

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
