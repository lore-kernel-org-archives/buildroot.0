From: Jonathan Liu <net147@gmail.com>
Date: Mon, 13 Aug 2012 13:05:48 +1000
Subject: [Buildroot] [PATCH v4 0/2] nodejs: new package
Message-ID: <1344827150-25067-1-git-send-email-net147@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathan Liu (2):
  python: enable bz2 module for host build
  nodejs: new package

 package/Config.in        |  1 +
 package/nodejs/Config.in | 20 +++++++++++++++
 package/nodejs/nodejs.mk | 63 ++++++++++++++++++++++++++++++++++++++++++++++++
 package/python/python.mk |  1 -
 4 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 package/nodejs/Config.in
 create mode 100644 package/nodejs/nodejs.mk

-- 
1.7.11.3
