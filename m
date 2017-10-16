From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 23:55:06 +0200
Subject: [Buildroot] [PATCH] libcurl: fix build without threads
In-Reply-To: <502def3c81c8bc65ada11c1bb87e65725b8b8900.1505216638.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 12 Sep 2017 14:43:58 +0300")
References: <502def3c81c8bc65ada11c1bb87e65725b8b8900.1505216638.git.baruch@tkos.co.il>
Message-ID: <87a80qsqpx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > When c-ares is not enabled libcurl enables the threaded DNS resolver by
 > default. Make sure the threaded resolvers is disabled when the toolchain
 > does not support threads.

 > Add upstream patch that fixes the configure option for disabling the
 > threaded resolver.

 > Fixes:
 > http://autobuild.buildroot.net/results/39f/39fa63fb2ecb75e4b2521d1ee3dfa357c4e5c594/
 > http://autobuild.buildroot.net/results/dfd/dfd296086d0d6bed73b92fe2fa4ba5434dddf796/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
