From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun,  5 Feb 2017 17:59:29 +0100
Subject: [Buildroot] [PATCH 0/3] docs/website: fixing feed API and gmane
Message-ID: <1486313972-27474-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series fixes the buildroot website and make it working again.

Angelo Compagnucci (3):
  docs/website: bump jquery and bootstrap
  docs/website: fix google feed API
  docs/website: switching from gmane to nabble

 docs/website/footer.html     |  5 ++-
 docs/website/header.html     |  2 +-
 docs/website/js/buildroot.js | 73 ++++++++++++++++----------------------------
 docs/website/support.html    |  6 ++--
 4 files changed, 34 insertions(+), 52 deletions(-)

-- 
2.7.4
