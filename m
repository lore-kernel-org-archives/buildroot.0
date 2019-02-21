From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Thu, 21 Feb 2019 17:27:24 -0300
Subject: [Buildroot] [PATCH 0/2] package/snort: bump to version 2.9.12
Message-ID: <1550780846-7463-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series will bump snort version to 2.9.12.

Since in this version OpenAppID is enabled by default, let's build it
only of its dependencies are enabled (luajit and openssl).

Sergio Prado (2):
  package/snort: bump to version 2.9.12
  package/snort: build with OpenAppID support if luajit/openssl is
    enabled

 ...-error-when-building-against-uclibc-or-mu.patch | 34 ++++++++++++++++++++++
 package/snort/snort.hash                           |  2 +-
 package/snort/snort.mk                             | 11 ++++++-
 3 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 package/snort/0006-Fix-compile-error-when-building-against-uclibc-or-mu.patch

-- 
2.7.4
