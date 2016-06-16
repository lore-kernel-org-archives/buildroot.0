From: Julien Floret <julien.floret@6wind.com>
Date: Thu, 16 Jun 2016 16:41:12 +0200
Subject: [Buildroot] [PATCH 0/3] sstrip: drop host variant and deprecate
	target variant
Message-ID: <1466088075-7635-1-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Host sstrip is not used anymore.
What's more, sstrip is not maintained and potentially harmful.

Julien Floret (3):
  sstrip: get rid of host variant
  Config.in: Add BR2_DEPRECATED_SINCE_2016_08
  sstrip: mark as deprecated

 Config.in                |  4 ++++
 package/sstrip/Config.in |  1 +
 package/sstrip/sstrip.mk | 12 ------------
 3 files changed, 5 insertions(+), 12 deletions(-)

-- 
2.1.0
