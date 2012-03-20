From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 21 Mar 2012 00:00:12 +0100
Subject: [Buildroot] [PATCH v1 0/1] mysql_client : bump version 5.1.60
Message-ID: <1332284413-1192-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mysql_client 5.1.60 is the latest in the 5.1.x series.
patches from 5.1.53 have been renamed to match the new version.

Sagaert Johan (1):
  mysql_client : bump version 5.1.53  to 5.1.60

 ...ch => mysql_client-5.1.60-ac_cache_check.patch} |    0
 ...l_client-5.1.60-configure-ps-cache-check.patch} |    0
 ...sql_client-5.1.60-use-new-readline-iface.patch} |    0
 package/mysql_client/mysql_client.mk               |    3 ++-
 4 files changed, 2 insertions(+), 1 deletion(-)
 rename package/mysql_client/{mysql_client-5.1.53-ac_cache_check.patch => mysql_client-5.1.60-ac_cache_check.patch} (100%)
 rename package/mysql_client/{mysql_client-5.1.53-configure-ps-cache-check.patch => mysql_client-5.1.60-configure-ps-cache-check.patch} (100%)
 rename package/mysql_client/{mysql_client-5.1.53-use-new-readline-iface.patch => mysql_client-5.1.60-use-new-readline-iface.patch} (100%)

-- 
1.7.9.3
