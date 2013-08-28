From: Thomas Davis <sunsetbrew@sunsetbrew.com>
Date: Tue, 27 Aug 2013 23:56:10 -0400
Subject: [Buildroot] [PATCHv4 0/1] civetweb: new package
Message-ID: <1377662171-2425-1-git-send-email-sunsetbrew@sunsetbrew.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Submission #4 with recommended changes.

1. Changed all cased lua/LUA to Lua in both the patch and the source repo.
2. Removed unneeded CIVETWEB_SOURCE variable
3. Changed install prefix from /usr/local to /usr
4. Moved default configuration file location from /usr/local/etc to /etc

Thank you,
Thomas Davis

Thomas Davis (1):
  civetweb: new package

 package/Config.in            |    1 +
 package/civetweb/Config.in   |   26 +++++++++++++++++++
 package/civetweb/civetweb.mk |   55 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+), 0 deletions(-)
 create mode 100644 package/civetweb/Config.in
 create mode 100644 package/civetweb/civetweb.mk

-- 
1.7.8.3
