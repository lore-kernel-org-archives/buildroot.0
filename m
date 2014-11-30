From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 15:17:51 +0100
Subject: [Buildroot] [PATCHv3 03/74] vsftpd: rename patches to the new
	naming convention
In-Reply-To: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417357142-14307-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../{vsftpd-0001-utmpx-builddef.patch => 0001-utmpx-builddef.patch}       | 0
 ...{vsftpd-dont-force-largefile.patch => 0002-dont-force-largefile.patch} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/vsftpd/{vsftpd-0001-utmpx-builddef.patch => 0001-utmpx-builddef.patch} (100%)
 rename package/vsftpd/{vsftpd-dont-force-largefile.patch => 0002-dont-force-largefile.patch} (100%)

diff --git a/package/vsftpd/vsftpd-0001-utmpx-builddef.patch b/package/vsftpd/0001-utmpx-builddef.patch
similarity index 100%
rename from package/vsftpd/vsftpd-0001-utmpx-builddef.patch
rename to package/vsftpd/0001-utmpx-builddef.patch
diff --git a/package/vsftpd/vsftpd-dont-force-largefile.patch b/package/vsftpd/0002-dont-force-largefile.patch
similarity index 100%
rename from package/vsftpd/vsftpd-dont-force-largefile.patch
rename to package/vsftpd/0002-dont-force-largefile.patch
-- 
2.1.0
