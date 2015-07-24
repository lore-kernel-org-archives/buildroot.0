From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 24 Jul 2015 22:05:14 +0200
Subject: [Buildroot] [PATCH 0/3] python-web2py improvements
Message-ID: <1437768317-9283-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series improves web2py disk space usage and bumps to the
latest version.

Angelo Compagnucci (3):
  package/python-web2py: cleaning for space savings
  package/python-pydal: bump to version v15.07
  package/python-web2py: bump to version R-2.11.2

 package/python-pydal/python-pydal.mk   |  2 +-
 package/python-web2py/Config.in        | 10 ++++++++++
 package/python-web2py/python-web2py.mk | 17 ++++++++++++-----
 3 files changed, 23 insertions(+), 6 deletions(-)

-- 
1.9.1
