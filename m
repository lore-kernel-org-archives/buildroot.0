From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 21:18:00 +0100
Subject: [Buildroot] [git commit] boost: add link giving the list of
	architectures supported by context
Message-ID: <20151103201847.D45A37F8FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7025021950da51a1e784fd03c5d73f4048fbbe8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To help understanding the list of architectures supported by
Boost.Context, add a link to the appropriate documentation page.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 150174c..edffd7e 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -65,6 +65,9 @@ config BR2_PACKAGE_BOOST_CHRONO
 config BR2_PACKAGE_BOOST_CONTAINER
 	bool "boost-container"
 
+# see
+# http://www.boost.org/doc/libs/1_59_0/libs/context/doc/html/context/architectures.html
+# for the list of supported architectures.
 config BR2_PACKAGE_BOOST_CONTEXT
 	bool "boost-context"
 	depends on (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel \
