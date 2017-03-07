From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue,  7 Mar 2017 23:23:46 +0100
Subject: [Buildroot] [PATCH v2 0/2] linux: Add CIP SLTS easy selection option
Message-ID: <1488925428-12805-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds an easy way to select the CIP project SLTS
kernel within the kernel menu.

This series:
* Adds a gitlab helper to download archive files
* Add the option to download the CIP kernel from TAG
  of from a branch

Angelo Compagnucci (2):
  package/pkg-download.mk: add gitlab helper
  linux: Add CIP SLTS easy selection option

 linux/Config.in         | 25 +++++++++++++++++++++++++
 linux/linux.mk          |  4 ++++
 package/pkg-download.mk |  3 +++
 3 files changed, 32 insertions(+)

-- 
2.7.4
