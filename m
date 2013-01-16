From: Bogdan Radulescu <bogdan@nimblex.net>
Date: Wed, 16 Jan 2013 14:49:33 +0000
Subject: [Buildroot] [PATCH] ncdu: new package
Message-ID: <1358347774-11998-1-git-send-email-bogdan@nimblex.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added the ncdu package with the changes suggested by Arnout. Thanks for that.
Also thank you Peter for reminding me about it.

Bogdan Radulescu (1):
  ncdu: new package

 package/Config.in      |  1 +
 package/ncdu/Config.in |  7 +++++++
 package/ncdu/ncdu.mk   | 14 ++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/ncdu/Config.in
 create mode 100644 package/ncdu/ncdu.mk

-- 
1.7.12.1
