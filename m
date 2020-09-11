From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Sep 2020 23:06:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/brotli: security update to
 version 1.0.9
In-Reply-To: <20200907103432.836767-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Mon, 7 Sep 2020 13:34:32 +0300")
References: <20200907103432.836767-1-aperez@igalia.com>
Message-ID: <87363oxbtk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Contains fixes for overflows when input chunks are larger than 2 GiB,
 > an uninitialized data access, and minor correctness and performance
 > improvements. There does not seem to be any CVEs filed, but there is
 > a security notice in the release notes at:

 >   https://github.com/google/brotli/releases/tag/v1.0.9

 > Patch "0001-CMake-Allow-using-BUILD_SHARED_LIBS-to-choose-static.patch"
 > is rebased against the latest upstream changes.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
