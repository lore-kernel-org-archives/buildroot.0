From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Apr 2019 23:28:08 +0200
Subject: [Buildroot] [PATCH] package/civetweb: fix linking failure due
 to wrong OpenSSL passed to pkg-config
In-Reply-To: <20190410103746.18403-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Wed, 10 Apr 2019 12:37:46 +0200")
References: <20190410103746.18403-1-giulio.benetti@micronovasrl.com>
Message-ID: <87a7gsff9z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > On commit 027a8b29f1e62d5ff5bbb15b79376614f902a680 pkg-config has been
 > added to retrieve OpenSSL dependencies, but it's been passed `libssl`
 > instead of `openssl`, this makes fail some linking. Indeed we need
 > OpenSSL dependency, so let's use `openssl` with pkg-config.

 > Substitute `libssl` with `openssl`.

 > Fixes:
 > http://autobuild.buildroot.net/results/b22/b225425ee237852bd9fee4ca0b8d24f3e37d64f9/

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
