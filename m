From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Feb 2021 17:53:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: fix issue when
 compiling with BR2_OPTIMIZE_G=y
In-Reply-To: <20210202165321.27243-1-ysionneau@kalray.eu> (Yann Sionneau via
 buildroot's message of "Tue, 2 Feb 2021 17:53:21 +0100")
References: <20210202165321.27243-1-ysionneau@kalray.eu>
Message-ID: <87eehvdbae.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann Sionneau via buildroot <buildroot@busybox.net> writes:

 > For instance on risc-v 64 arch the build would otherwise fail because
 > of undefined ucontext_t because "-DOPENSSL_NO_ASYNC" would not propagate
 > through to CFLAGS in the Makefile.

 > Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
