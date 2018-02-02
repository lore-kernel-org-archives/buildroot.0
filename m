From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  2 Feb 2018 14:57:12 -0600
Subject: [Buildroot] [PATCH v3 2/3] autobuilder: schema update for branch
 varchar
In-Reply-To: <20180202205713.27191-1-matthew.weber@rockwellcollins.com>
References: <20180202205713.27191-1-matthew.weber@rockwellcollins.com>
Message-ID: <20180202205713.27191-4-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 web/schema.sql | 1 +
 1 file changed, 1 insertion(+)

diff --git a/web/schema.sql b/web/schema.sql
index 929ceed..e496283 100644
--- a/web/schema.sql
+++ b/web/schema.sql
@@ -11,6 +11,7 @@ CREATE TABLE `results` (
   `static` tinyint(1) NOT NULL default '0',
   `subarch` varchar(64) NOT NULL DEFAULT '',
   `duration` int(11) NOT NULL DEFAULT '0',
+  `branch` varchar(64) NOT NULL DEFAULT '',
   PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
-- 
2.14.2
