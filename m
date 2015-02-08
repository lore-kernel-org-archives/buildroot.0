From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 8 Feb 2015 15:07:04 +0000
Subject: [Buildroot] [PATCH 0/3] glibc: bump version to 2.21
Message-ID: <1423408027-49694-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add version 2.21
- Add a hash value for it
- Set version 2.20 as default
- Remove version 2.19

Vicente Olivert Riera (3):
  glibc: add version 2.21
  glibc: set version 2.20 as default
  glibc: remove version 2.19

 package/glibc/2.19/0001-CVE-2014-7817.patch |  173 ---------------------------
 package/glibc/2.19/0002-CVE-2014-6040.patch |  141 ----------------------
 package/glibc/2.19/0003-CVE-2014-9402.patch |   24 ----
 package/glibc/Config.in                     |    8 +-
 package/glibc/glibc.hash                    |    2 +-
 5 files changed, 5 insertions(+), 343 deletions(-)
 delete mode 100644 package/glibc/2.19/0001-CVE-2014-7817.patch
 delete mode 100644 package/glibc/2.19/0002-CVE-2014-6040.patch
 delete mode 100644 package/glibc/2.19/0003-CVE-2014-9402.patch
