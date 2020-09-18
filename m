From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 18 Sep 2020 12:22:23 +0200
Subject: [Buildroot] [PATCH v4 0/2] Improving CVE reporting
Message-ID: <20200918102225.76756-1-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Most of the series was applied and there were sill this 2 patches
pending.

But since their submission the code base has evolved so I adapted to
apply them on the master branch.

Gregory


Gregory CLEMENT (2):
  support/script/pkg-stats: Manage the CVEs that need to be check
  support/script/cve-checker: Manage the CVEs that need to be check

 support/scripts/cve-checker | 21 +++++++++++++++++++--
 support/scripts/pkg-stats   | 25 ++++++++++++++++++++++++-
 2 files changed, 43 insertions(+), 3 deletions(-)

-- 
2.28.0
