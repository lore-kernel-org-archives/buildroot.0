From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 22:35:46 +0200
Subject: [Buildroot] [PATCH] package/faketime: fix build with gcc >= 6
In-Reply-To: <20170514212643.17153-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 14 May 2017 23:26:43 +0200")
References: <20170514212643.17153-1-romain.naour@gmail.com>
Message-ID: <87y3tv43x9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Upstream added -Wno-nonnull-compare to disable this error [1].
 > Fixes:
 > libfaketime.c:513:7: error?: nonnull argument ??buf?? compared to NULL [-Werror=nonnull-compare]
 >     if (buf != NULL)
 >        ^
 > [1] https://github.com/wolfcw/libfaketime/commit/47e958b753fc15098a2b7d0e9ef26b83ee255874

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
