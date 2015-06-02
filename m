From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue,  2 Jun 2015 10:46:17 +0200
Subject: [Buildroot] [PATCH v2 0/3] Caring at91bootstrap3
Message-ID: <1433234780-21084-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series:
* Add license information to at91bootstrap
* Bumps to v3.7.2
* Adds the option to download via git from custom url

Angelo Compagnucci (3):
  boot/at91bootstrap3: add license information
  boot/at91bootstrap3: bump to version 3.7.2
  boot/at91bootstrap3: download via custom git url

 boot/at91bootstrap3/Config.in         | 34 ++++++++++++++++++++++++++++++++++
 boot/at91bootstrap3/at91bootstrap3.mk | 21 ++++++++++++++++++++-
 2 files changed, 54 insertions(+), 1 deletion(-)

-- 
2.4.2
