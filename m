From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sun,  3 May 2009 13:41:54 +0200
Subject: [Buildroot] [PATCH 0/4] scripts/package wizard: fixes and
	improvements
Message-ID: <1241350918-32451-1-git-send-email-markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I had this in my tree for too long time now without ever finishing it. Now it's
finally done and I hope I can delete my branch soon :)

Markus Heidelberg (4):
  scripts/package wizard: make workable from TOPDIR
  scripts/package wizard: delete trailing whitespace and empty lines
  scripts/package wizard: add support for subdirs
  scripts/package wizard: clarify the steps after the wizard

 scripts/add_new_package.wizard |   52 ++++++++++++++++++++++++++++++---------
 1 files changed, 40 insertions(+), 12 deletions(-)
