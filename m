From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 5 Mar 2021 10:48:10 +0100
Subject: [Buildroot] Analysis of build results for 2021-03-03
In-Reply-To: <20210304224926.45aa4056@windsurf.home>
References: <20210304081519.C821B4B530@smtp4.osuosl.org>
 <20210304224926.45aa4056@windsurf.home>
Message-ID: <CAAXf6LVstHLbFJU9BKMWsZhBqJ4KYZrQv2Ufh8mZzUuY6V6=2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

El jue, 4 mar 2021 a las 22:49, Thomas Petazzoni
(<thomas.petazzoni@bootlin.com>) escribi?:
[..]
>
> >    x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/d530db0f37e1e0462e3af1e1787e15f94ff21884 | ORPH
>
> /home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/9.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: ../libopenblas_nehalem-r0.3.9.a(sbdsvdx.o): relocation R_X86_64_32 against `.rodata.str1.1' can not be used when making a shared object; recompile with -fPIC
>
> Thomas DS, you are now our expert in openblas. Could you have a look ?
>

Yes I will have a look. I can reproduce locally, will see if I can fix it.
