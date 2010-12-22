From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Dec 2010 14:07:07 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.02/fix-bug-2371
Message-ID: <cover.1293023213.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 11ab05f53a16f635a27139b33170a9dadba9f3c5:
  Peter Korsgaard (1):
        qt: svg and multimedia modules depends on gui module as well

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2011.02/fix-bug-2371

Thomas Petazzoni (2):
      mysql_client: bump to 5.1.53 to fix abi check problem
      qt: fix bug 2371

 ...ch => mysql_client-5.1.53-ac_cache_check.patch} |   17 ++++++++++-----
 ...l_client-5.1.53-configure-ps-cache-check.patch} |   22 +++++++++++--------
 ...sql_client-5.1.53-use-new-readline-iface.patch} |   12 +++++++---
 package/mysql_client/mysql_client.mk               |    2 +-
 package/qt/qt.mk                                   |    3 +-
 5 files changed, 34 insertions(+), 22 deletions(-)
 rename package/mysql_client/{mysql_client-5.1.47-ac_cache_check.patch => mysql_client-5.1.53-ac_cache_check.patch} (91%)
 rename package/mysql_client/{mysql_client-5.1.47-configure-ps-cache-check.patch => mysql_client-5.1.53-configure-ps-cache-check.patch} (57%)
 rename package/mysql_client/{mysql_client-5.1.47-use-new-readline-iface.patch => mysql_client-5.1.53-use-new-readline-iface.patch} (70%)

Thanks,
-- 
Thomas Petazzoni
