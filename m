From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 May 2015 20:23:52 +0200
Subject: [Buildroot] [PATCH 5/6] qt5base: rename patch to avoid conflict on
	0002
In-Reply-To: <1431714233-24324-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1431714233-24324-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1431714233-24324-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are currently two patches with the 0002 sequence number, which
isn't great. Rename one of them to use the 0003 sequence number.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../qt5/qt5base/{0002-mkspecs-files.patch => 0003-mkspecs-files.patch}    | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/qt5/qt5base/{0002-mkspecs-files.patch => 0003-mkspecs-files.patch} (100%)

diff --git a/package/qt5/qt5base/0002-mkspecs-files.patch b/package/qt5/qt5base/0003-mkspecs-files.patch
similarity index 100%
rename from package/qt5/qt5base/0002-mkspecs-files.patch
rename to package/qt5/qt5base/0003-mkspecs-files.patch
-- 
2.1.0
