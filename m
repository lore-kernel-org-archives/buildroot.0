From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 29 Aug 2013 17:41:07 -0500
Subject: [Buildroot] [PATCH v2 0/1] Update libcurl to version 7.32.0
Message-ID: <1377816068-3368-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These patches update the version of libcurl to version 7.32.0 and remove
the static library and documentation from being installed on the target.

NOTE: these patches depend on my previously submitted patches for libssh2

Changes from v1->v2:
  * removal of the patch for removing of man and static lib from target 
    (suggested by Arnout Vandecappelle)
  * no longer depends on my patch for libssh2

Ryan Barnett (1):
  libcurl: up revision to 7.32.0

 package/libcurl/libcurl-01-CVE-2013-0249.patch |   65 ------------------------
 package/libcurl/libcurl-02-CVE-2013-1944.patch |   57 ---------------------
 package/libcurl/libcurl-03-CVE-2013-2174.patch |   38 --------------
 package/libcurl/libcurl.mk                     |    4 +-
 4 files changed, 2 insertions(+), 162 deletions(-)
 delete mode 100644 package/libcurl/libcurl-01-CVE-2013-0249.patch
 delete mode 100644 package/libcurl/libcurl-02-CVE-2013-1944.patch
 delete mode 100644 package/libcurl/libcurl-03-CVE-2013-2174.patch
