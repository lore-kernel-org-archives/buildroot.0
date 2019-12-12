From: Jan Kiszka <jan.kiszka@siemens.com>
Date: Thu, 12 Dec 2019 19:44:36 +0100
Subject: [Buildroot] [PATCH 0/4] package/xenomai: Fixes, updates,
 enhancements
Message-ID: <cover.1576176280.git.jan.kiszka@siemens.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just a couple of improvements I came across while building me a virtual
ppc32 test target.

Jan

PS: @CC, sorry, had to send twice as the list is not open.

Jan Kiszka (4):
  package/xenomai: Smokey's not a skin
  package/xenomai: Pull from git
  package/xenomai: Bump version to 3.0.10
  package/xenomai: Clean up wrappers cleanup

 package/xenomai/Config.in    |  5 -----
 package/xenomai/xenomai.hash |  2 +-
 package/xenomai/xenomai.mk   | 39 +++++++++++++++++++++------------------
 3 files changed, 22 insertions(+), 24 deletions(-)

-- 
2.16.4
