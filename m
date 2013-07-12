From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Jul 2013 10:26:11 +0200
Subject: [Buildroot] [git commit] erlang: add upstream URL
Message-ID: <20130712082825.B47EF9A293@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d09b72d608fe91e8305f1c12df42cd68f79c500
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/erlang/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 6920db6..27206f3 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -8,6 +8,8 @@ config BR2_PACKAGE_ERLANG
 	  telephony and instant messaging. Erlang's runtime system has
 	  built-in support for concurrency, distribution and fault tolerance.
 
+	  http://www.erlang.org
+
 config BR2_PACKAGE_ERLANG_MEGACO
 	bool "install megaco application"
 	depends on BR2_PACKAGE_ERLANG
