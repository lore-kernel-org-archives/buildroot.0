From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 5 Mar 2014 15:30:01 +0000
Subject: [Buildroot] [PATCH 2/2] cups: rename patches to follow BR guidelines
In-Reply-To: <1394033401-23331-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1394033401-23331-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1394033401-23331-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...h => cups-0002-fix-stack-protector-check.patch} |    0
 ...s-mantohtml.patch => cups-0003-mantohtml.patch} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/cups/{cups-fix-stack-protector-check.patch => cups-0002-fix-stack-protector-check.patch} (100%)
 rename package/cups/{cups-mantohtml.patch => cups-0003-mantohtml.patch} (100%)

diff --git a/package/cups/cups-fix-stack-protector-check.patch b/package/cups/cups-0002-fix-stack-protector-check.patch
similarity index 100%
rename from package/cups/cups-fix-stack-protector-check.patch
rename to package/cups/cups-0002-fix-stack-protector-check.patch
diff --git a/package/cups/cups-mantohtml.patch b/package/cups/cups-0003-mantohtml.patch
similarity index 100%
rename from package/cups/cups-mantohtml.patch
rename to package/cups/cups-0003-mantohtml.patch
-- 
1.7.1
