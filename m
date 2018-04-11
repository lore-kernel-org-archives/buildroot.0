From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Apr 2018 17:47:35 +0200
Subject: [Buildroot] [PATCH] sngrep: fix libgcrypt handling
In-Reply-To: <20180329135814.4067-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 29 Mar 2018 15:58:14 +0200")
References: <20180329135814.4067-1-peter@korsgaard.com>
Message-ID: <87r2nlzqw8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/f1c6494133806b9fc26ae3ce9e9c6a22fa2eda6f/

 > Commit 6205b75873c (sngrep: gnutls support also needs libgcrypt) ensured
 > that --with-gnutls is only used when both gnutls and libgcrypt are enabled,
 > but it didn't ensure libgcrypt gets built before sngrep or told the
 > configure script where to find libgcrypt-config, breaking the build.

 > Fix both issues.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
