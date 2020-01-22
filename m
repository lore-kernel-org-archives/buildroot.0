From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2020 21:21:19 +0100
Subject: [Buildroot] [git commit] package/czmq: fix typo for LICNESE hash
Message-ID: <20200122201212.715CA83700@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d7d019a2692f912c440ee9ee10199bb624da770
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/czmq/czmq.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/czmq/czmq.hash b/package/czmq/czmq.hash
index 97b6e03b54..4738c9c434 100644
--- a/package/czmq/czmq.hash
+++ b/package/czmq/czmq.hash
@@ -3,4 +3,4 @@ md5 7e09997db6ac3b25e8ed104053040722 czmq-4.2.0.tar.gz
 sha1 42165b3eede517708814e5a1b6972d8bde417f7a czmq-4.2.0.tar.gz
 # Locally calculated
 sha256 cfab29c2b3cc8a845749758a51e1dd5f5160c1ef57e2a41ea96e4c2dcc8feceb czmq-4.2.0.tar.gz
-sha256 1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5 LICENCE
+sha256 1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5 LICENSE
