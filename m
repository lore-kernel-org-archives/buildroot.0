From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jan 2020 09:16:50 +0100
Subject: [Buildroot] [PATCH 18/26] package/czmq: fix typo for LICNESE hash
In-Reply-To: <20200122081657.31817-1-heiko.thiery@gmail.com>
References: <20200122081657.31817-1-heiko.thiery@gmail.com>
Message-ID: <20200122081657.31817-19-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
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
-- 
2.20.1
