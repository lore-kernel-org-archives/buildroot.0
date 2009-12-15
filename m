From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 20:31:10 +0100
Subject: [Buildroot] [PATCH 39/39] documentation: slightly improve CSS
In-Reply-To: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a4eee8c3348fd47d84479eef63341779991e9db7.1260905467.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/stylesheet.css |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/docs/stylesheet.css b/docs/stylesheet.css
index 2c36417..ac938c5 100644
--- a/docs/stylesheet.css
+++ b/docs/stylesheet.css
@@ -49,6 +49,16 @@ h3 {
 	margin-left: 10px;
 	margin-right: 10px;
 	color: #336699;
+        border-bottom: 2px solid #336699;
+}
+
+h4 { 
+	font: italic normal 14pt georgia; 
+	letter-spacing: 1px; 
+	margin-bottom: 0px; 
+	margin-left: 10px;
+	margin-right: 10px;
+        border-bottom: 1px dashed black;
 }
 
 p {
-- 
1.6.3.3
