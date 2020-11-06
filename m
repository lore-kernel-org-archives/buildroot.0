From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Nov 2020 08:17:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/libsigrokdecode: fix build with
 python 3.9
In-Reply-To: <20201105174623.933007-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 5 Nov 2020 18:46:23 +0100")
References: <20201105174623.933007-1-fontaine.fabrice@gmail.com>
Message-ID: <87361nymw9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This will fix the following build failure with python 3.9 and
 > sigrok-cli:

 > /srv/storage/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/5.5.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld:
 > /srv/storage/autobuild/run/instance-1/output-1/host/bin/../mips64el-buildroot-linux-uclibc/sysroot/usr/lib/libsigrokdecode.so:
 > undefined reference to `PyList_Insert'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/cc6447b926f8223c68d0086428d29a037b18252d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
