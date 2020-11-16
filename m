From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 21:30:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/numactl: needs -fPIC
In-Reply-To: <20201114221124.1083376-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 14 Nov 2020 23:11:24 +0100")
References: <20201114221124.1083376-1-fontaine.fabrice@gmail.com>
Message-ID: <87k0ul3v01.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This will avoid the following build failure with qemu 5.0.0 and above:
 > /srv/storage/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld:
 > /srv/storage/autobuild/run/instance-2/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/../lib64/libnuma.a(libnuma.o):
 > relocation R_X86_64_32 against `.rodata.str1.1' can not be used when
 > making a PIE object; recompile with -fPIC

 > Fixes:
 >  - http://autobuild.buildroot.org/results/616dff216a215dc0494c846d337e03e0795b2fb2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
