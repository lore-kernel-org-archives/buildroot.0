From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 29 May 2015 11:38:43 +0200
Subject: [Buildroot] [PATCH 0/3] Caring at91bootstrap3
Message-ID: <1432892326-10261-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series:
* Add license information to at91bootstrap
* Bumps to v3.7.2
* Add the option to download via git from custom url

Angelo Compagnucci (3):
  boot/at91bootstrap3: add license information
  boot/at91bootstrap3: bump to version 3.7.2
  boot/at91bootstrap3: download via cutom git url

 boot/at91bootstrap3/Config.in         | 34 ++++++++++++++++++++++++++++++++++
 boot/at91bootstrap3/at91bootstrap3.mk | 11 ++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)

-- 
1.9.1
