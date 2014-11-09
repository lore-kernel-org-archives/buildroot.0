From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Nov 2014 14:18:47 +0100
Subject: [Buildroot] [PATCH 1/3] quota: rename patch to the new convention
In-Reply-To: <1415539129-25721-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1415539129-25721-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1415539129-25721-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As a preparation to the introduction of an additional patch to quota,
let's rename the existing patch to the new naming convention.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...{quota-01-tools-getrpcbynumber.patch => 01-tools-getrpcbynumber.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/quota/{quota-01-tools-getrpcbynumber.patch => 01-tools-getrpcbynumber.patch} (100%)

diff --git a/package/quota/quota-01-tools-getrpcbynumber.patch b/package/quota/01-tools-getrpcbynumber.patch
similarity index 100%
rename from package/quota/quota-01-tools-getrpcbynumber.patch
rename to package/quota/01-tools-getrpcbynumber.patch
-- 
2.0.0
