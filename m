From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Dec 2017 21:50:29 +0100
Subject: [Buildroot] [PATCH 1/1] webkitgtk: Add upstream patch to ensure
 CMAKE_BUILD_TYPE is honored
In-Reply-To: <20171129141751.9325-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Wed, 29 Nov 2017 16:17:51 +0200")
References: <20171129141751.9325-1-aperez@igalia.com>
Message-ID: <871sjpceei.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Make WebKitGTK+ honor the value of CMAKE_BUILD_TYPE defined in the CMake
 > toolchain file by backporting the following upstream WebKit patch:

 >     https://trac.webkit.org/changeset/225168

 > This reduces the generated binary sizes when building in "Release" mode
 > (BR2_ENABLE_DEBUG=n), for example when targeting ARMv8 the size reduction
 > is ~17 MiB.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
