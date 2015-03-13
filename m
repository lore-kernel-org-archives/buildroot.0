From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 13 Mar 2015 11:50:03 +0100
Subject: [Buildroot] [PATCH 0/2] Makedevs: add recursive option
Message-ID: <1426243805-8317-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series add the recursive option to makedevs.

With recursive option will be possible to apply owner/permission
recursively to folders.

Angelo Compagnucci (2):
  package/makedevs: add recursive option
  docs/manual: documentation for recursive makedevs syntax

 docs/manual/makedev-syntax.txt | 10 +++++++++-
 package/makedevs/makedevs.c    | 23 +++++++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)

-- 
1.9.1
