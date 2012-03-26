From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Mar 2012 00:33:21 +0200
Subject: [Buildroot] [PATCH 1/1] lttng-libust: rename patch so that it is
	taken into account
In-Reply-To: <cover.1332801197.git.thomas.petazzoni@free-electrons.com>
References: <cover.1332801197.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b3435944bbaf51566d808dc51aea2e2715143dbd.1332801197.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package/lttng-libust/ contains a patch prefixed with
lttng-libust-1.9.2, so the other patch simply prefixed with
lttng-libust does not get applied. Rename the second patch properly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ... lttng-libust-1.9.2-fix-overflow-32-bits.patch} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename package/lttng-libust/{lttng-libust-fix-overflow-32-bits.patch => lttng-libust-1.9.2-fix-overflow-32-bits.patch} (100%)

diff --git a/package/lttng-libust/lttng-libust-fix-overflow-32-bits.patch b/package/lttng-libust/lttng-libust-1.9.2-fix-overflow-32-bits.patch
similarity index 100%
rename from package/lttng-libust/lttng-libust-fix-overflow-32-bits.patch
rename to package/lttng-libust/lttng-libust-1.9.2-fix-overflow-32-bits.patch
-- 
1.7.4.1
