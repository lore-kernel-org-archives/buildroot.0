From: Scott Fan <fancp2007@gmail.com>
Date: Mon, 31 Aug 2015 00:05:09 +0800
Subject: [Buildroot] [PATCH v2] libssh: new package
Message-ID: <1440950710-9165-1-git-send-email-fancp2007@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

I've fixed this patch as your suggestion, the key point is -DWITH_STACK_PROTECTOR=OFF.

I think it works right now.

Thanks.

Scott Fan (1):
  libssh: new package

 package/Config.in          |  1 +
 package/libssh/Config.in   | 11 +++++++++++
 package/libssh/libssh.hash |  2 ++
 package/libssh/libssh.mk   | 36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 package/libssh/Config.in
 create mode 100644 package/libssh/libssh.hash
 create mode 100644 package/libssh/libssh.mk

-- 
2.5.1
