From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 05 Sep 2020 10:27:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: disable examples and
 tests
In-Reply-To: <20200902204310.3909104-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 2 Sep 2020 22:43:10 +0200")
References: <20200902204310.3909104-1-fontaine.fabrice@gmail.com>
Message-ID: <87wo18k4qe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Examples and tests are not needed especially because of them fails on
 > some architectures because it wrongly tries to use wc_Sha256FinalRaw:

 >   CCLD     tests/unit.test
 > /tmp/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-none-linux-gnu/9.2.1/../../../../aarch64-none-linux-gnu/bin/ld: tests/tests_unit_test-api.o: in function `test_wc_Sha256FinalRaw':
 > /tmp/instance-0/output-1/build/wolfssl-4.5.0-stable/tests/api.c:6504: undefined reference to `wc_Sha256FinalRaw'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/d5b6f97f7510874fe28c675e599be08cb8a78c7b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
