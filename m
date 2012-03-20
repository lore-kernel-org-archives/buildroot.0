From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 21 Mar 2012 00:37:10 +0100
Subject: [Buildroot] [PATCH v2 0/1] mysql_client : bump version from 5.1.53
	to 5.1.60
Message-ID: <1332286631-4020-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 5.1.60 is the latest version in the 5.1.x series of mysql_client.
Patches from 5.1.53 have renamed to match the version.

Sagaert Johan (1):
  mysql_client : bump version from 5.1.53 to 5.1.60

 ...ch => mysql_client-5.1.60-ac_cache_check.patch} |    0
 ...l_client-5.1.60-configure-ps-cache-check.patch} |    0
 ...sql_client-5.1.60-use-new-readline-iface.patch} |    0
 package/mysql_client/mysql_client.mk               |    4 ++--
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename package/mysql_client/{mysql_client-5.1.53-ac_cache_check.patch => mysql_client-5.1.60-ac_cache_check.patch} (100%)
 rename package/mysql_client/{mysql_client-5.1.53-configure-ps-cache-check.patch => mysql_client-5.1.60-configure-ps-cache-check.patch} (100%)
 rename package/mysql_client/{mysql_client-5.1.53-use-new-readline-iface.patch => mysql_client-5.1.60-use-new-readline-iface.patch} (100%)

-- 
1.7.9.3
