From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 16:44:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/pistache: fix static build
In-Reply-To: <20201017135449.3459214-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 17 Oct 2020 15:54:49 +0200")
References: <20201017135449.3459214-1-fontaine.fabrice@gmail.com>
Message-ID: <87mu05ghp0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Don't build shared library with BR2_SHARED_LIBS=OFF to avoid the
 > following build failure:

 > [100%] Linking CXX shared library libpistache.so
 > make[3]: Leaving directory
 > `/home/buildroot/autobuild/run/instance-1/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d'
 > [100%] Built target pistache_static
 > /home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/8.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld:
 > /home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/8.3.0/crtbeginT.o:
 > relocation R_X86_64_32 against hidden symbol `__TMC_END__' can not be
 > used when making a shared object

 > Fixes:
 >  - http://autobuild.buildroot.org/results/6cc/6cc76b3e76defa9b8154568a6ebcd6bf4cadd334/build-end.log

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.08.x (pistache not in 2020.02), thanks.

-- 
Bye, Peter Korsgaard
