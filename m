From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2016 12:18:17 +0100
Subject: [Buildroot] [PATCH] yajl: Bump version to 2.1.0
In-Reply-To: <1454431113-32207-1-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Tue, 2 Feb 2016 17:38:33 +0100")
References: <1454431113-32207-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87egcb1t6u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > Remove 0001-math-link.patch as some added code render it useless.
 > Rework 0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
 > because it did not apply anymore.
 > This patch is already in a PR upstream.

 > Add 0001-cmake-uClibc-Fix-missing-libm-for-tests.patch, to fix a build
 > error with uClibc toolchain.
 > This has been sent upstream:
 > https://github.com/lloyd/yajl/pull/184

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
