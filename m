From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sat, 18 Apr 2015 18:54:24 +0200
Subject: [Buildroot] [PATCH 0/3] expect: bump to version 5.45.3
Message-ID: <1429376067-9228-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch set update the package expect and because the version
5.45.3 version is aviable only in cvs without a tag add the
possibility to use a date to download from cvs.

Best regards

Fabio Porcedda (3):
  support/download/cvs: add support to use a date instead of a tag
  manual: cvs: document that a date can be used instead of a tag
  expect: bump to version 5.45.3

 docs/manual/adding-packages-generic.txt |  2 +-
 package/expect/expect.hash              |  2 --
 package/expect/expect.mk                |  5 ++---
 support/download/cvs                    | 10 +++++++++-
 4 files changed, 12 insertions(+), 7 deletions(-)
 delete mode 100644 package/expect/expect.hash

-- 
2.3.5
