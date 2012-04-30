From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Apr 2012 10:33:54 -0300
Subject: [Buildroot] [PATCHv2 3/3] package/multimedia: drop libraries,
	it's just applications now
In-Reply-To: <1335792834-25918-1-git-send-email-gustavo@zacarias.com.ar>
References: <1335792834-25918-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1335792834-25918-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index abaed83..d85f4b4 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -1,4 +1,4 @@
-menu "Audio and video libraries and applications"
+menu "Audio and video applications"
 source "package/multimedia/alsa-utils/Config.in"
 source "package/multimedia/audiofile/Config.in"
 source "package/multimedia/aumix/Config.in"
-- 
1.7.3.4
