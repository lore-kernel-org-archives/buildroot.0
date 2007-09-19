From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 14:31:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/olsr
Message-ID: <20070919213133.320B930042@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 14:31:32 -0700 (Wed, 19 Sep 2007)
New Revision: 19902

Log:
- i suppose that '$' is not really needed..


Modified:
   trunk/buildroot/package/olsr/S50olsr


Changeset:
Modified: trunk/buildroot/package/olsr/S50olsr
===================================================================
--- trunk/buildroot/package/olsr/S50olsr	2007-09-19 21:27:49 UTC (rev 19901)
+++ trunk/buildroot/package/olsr/S50olsr	2007-09-19 21:31:32 UTC (rev 19902)
@@ -13,7 +13,7 @@
 	killall olsrd
 	;;
   *)
-	echo $"Usage: $0 {start|stop}"
+	echo "Usage: $0 {start|stop}"
 	exit 1
 esac
 
