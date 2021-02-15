From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Feb 2021 22:50:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/ne10: disable unit tests and
 examples
In-Reply-To: <20210215174543.1096976-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 15 Feb 2021 18:45:43 +0100")
References: <20210215174543.1096976-1-fontaine.fabrice@gmail.com>
Message-ID: <87zh059f1l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Unit tests fail to build with gcc 10 on:
 > [100%] Linking C executable NE10_dsp_unit_test_smoke
 > /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-none-linux-gnu/10.2.1/../../../../aarch64-none-linux-gnu/bin/ld: CMakeFiles/NE10_dsp_unit_test_static.dir/__/modules/dsp/test/test_suite_fft_float32.c.o:(.bss+0x0): multiple definition of `seatest_simple_test_result'; CMakeFiles/NE10_dsp_unit_test_static.dir/__/modules/dsp/test/test_main.c.o:(.bss+0x0): first defined here

 > So just disable them and, while at it, also disable examples which are
 > also enabled by default

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c658d52668825c26a15d6ac3ca538472cad5cd78

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
