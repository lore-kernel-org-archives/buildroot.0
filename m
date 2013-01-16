From: Bogdan Radulescu <bogdan@nimblex.net>
Date: Wed, 16 Jan 2013 15:49:37 +0000
Subject: [Buildroot] [PATCH] iftop: new package
Message-ID: <1358351378-10876-1-git-send-email-bogdan@nimblex.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added the iftop package which is really nice to easily see
what uses the bandwidth on your machine.

Bogdan Radulescu (1):
  iftop: new package

 package/Config.in       |  1 +
 package/iftop/Config.in | 12 ++++++++++++
 package/iftop/iftop.mk  | 14 ++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/iftop/Config.in
 create mode 100644 package/iftop/iftop.mk

-- 
1.7.12.1
