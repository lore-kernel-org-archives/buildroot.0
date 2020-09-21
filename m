From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 21 Sep 2020 12:15:12 +0200
Subject: [Buildroot] [PATCH v5 0/3] Improving CVE reporting
Message-ID: <20200921101515.132359-1-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Most of the series was applied and there were sill this 3 patches
pending.

But since their submission the code base has evolved so I adapted to
apply them on the master branch.

Compared to the v4, this version adds patch "package/pkg-utils/cve.py:
Manage case when package version doesn't exist" that I wrongly thought
was already applied.

Gregory

Gregory CLEMENT (3):
  support/script/pkg-stats: Manage the CVEs that need to be check
  support/script/cve-checker: Manage the CVEs that need to be check
  package/pkg-utils/cve.py: Manage case when package version doesn't
    exist

 support/scripts/cve-checker | 21 +++++++++++++++++++--
 support/scripts/cve.py      |  7 ++++++-
 support/scripts/pkg-stats   | 25 ++++++++++++++++++++++++-
 3 files changed, 49 insertions(+), 4 deletions(-)

-- 
2.28.0
