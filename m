From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Oct 2018 12:01:21 +0200
Subject: [Buildroot] [PATCH 1/1] brotli: update to version 1.0.7
In-Reply-To: <20181024233823.22831-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Thu, 25 Oct 2018 02:38:23 +0300")
References: <20181024233823.22831-1-aperez@igalia.com>
Message-ID: <87h8h958ni.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > The new version, among other changes, includes important fixes
 > for unaligned memory access on ARM (both for 32 and 64-bit), as well
 > as performance improvements and build fixes.

Does this mean that we should backport this version bump to the current
LTS release (2018.02.x) as well then?

 > Patch "0001-Tell-CMake-to-not-check-for-a-C-compiler.patch" is not
 > needed due to the issue being fixed upstream, and therefore is removed.

 > Patch "0001-CMake-Allow-using-BUILD_SHARED_LIBS-to-choose-static.patch"
 > is rebased against the latest upstream changes.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
