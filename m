From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 23:33:33 +0100
Subject: [Buildroot] [PATCH 1/1] webkitgtk: security bimp to version
 2.18.4
In-Reply-To: <20171221133630.29763-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Thu, 21 Dec 2017 15:36:30 +0200")
References: <20171221133630.29763-1-aperez@igalia.com>
Message-ID: <874lobol6q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > This is a maintenance release of the current stable WebKitGTK+ version,
 > which contains for CVE-2017-13866, CVE-2017-13870, CVE-2017-7156, and
 > CVE-2017-13856. Additionally, this release brings improvements in the
 > WebDriver spec-compliance, plugs several memory leaks in its GStreamer
 > based multimedia backend, and fixes a bug when handling cookie removal.

 > Release notes can be found in the announcement:

 >   https://webkitgtk.org/2017/12/19/webkitgtk2.18.4-released.html

 > More details about the security fixes are provided in the following
 > WebKitGTK+ Security Advisory report:

 >   https://webkitgtk.org/security/WSA-2017-0010.html

 > Last but not least, this new release includes the fix for honoring the
 > CMAKE_BUILD_TYPE value from CMake toolchain files and the corresponding
 > patch is removed.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
