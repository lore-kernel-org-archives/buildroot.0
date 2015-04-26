From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 27 Apr 2015 01:40:17 +0200
Subject: [Buildroot] [PATCH 0/4] Use a date for cvs and bump expect
Message-ID: <1430091621-4698-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch set bump expect and in order to do that add to the cvs
script support for using a date instead of a tag.

v2:
 - add acked-by to the first patch
 - improve documentation about the date
 - use TZ=UCT to set a default time zone
 - add a patch to remove the comment at the end of the version string

Fabio Porcedda (4):
  support/download/cvs: add support to use a date instead of a tag
  manual: cvs: document that a date can be used instead of a tag
  expect: bump to version 5.45.3
  manual: don't use a comment at the end of the version variable
    assignment

 docs/manual/adding-packages-generic.txt |  4 +++-
 docs/manual/adding-packages-tips.txt    |  3 ++-
 package/expect/expect.hash              |  2 --
 package/expect/expect.mk                |  6 +++---
 support/download/cvs                    | 11 ++++++++++-
 5 files changed, 18 insertions(+), 8 deletions(-)
 delete mode 100644 package/expect/expect.hash

-- 
2.3.5
