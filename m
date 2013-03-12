From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 12 Mar 2013 19:10:55 +0100
Subject: [Buildroot] [PATCH 2 of 3] oprofile: upstep 0.9.7 patches to 0.9.8
In-Reply-To: <patchbomb.1363111853@BEANTN0L019720>
References: <patchbomb.1363111853@BEANTN0L019720>
Message-ID: <41943bd3969a02bce5f9.1363111855@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patches to oprofile 0.9.7 seem still relevant for 0.9.8, but for some
reason they were not upstepped.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/oprofile/oprofile-0.9.7-001-avr32-enable-lookup_dcookie.patch |  0
 package/oprofile/oprofile-0.9.7-002-no-query-modules.patch            |  0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/oprofile/oprofile-0.9.7-001-avr32-enable-lookup_dcookie.patch b/package/oprofile/oprofile-0.9.8-001-avr32-enable-lookup_dcookie.patch
rename from package/oprofile/oprofile-0.9.7-001-avr32-enable-lookup_dcookie.patch
rename to package/oprofile/oprofile-0.9.8-001-avr32-enable-lookup_dcookie.patch
diff --git a/package/oprofile/oprofile-0.9.7-002-no-query-modules.patch b/package/oprofile/oprofile-0.9.8-002-no-query-modules.patch
rename from package/oprofile/oprofile-0.9.7-002-no-query-modules.patch
rename to package/oprofile/oprofile-0.9.8-002-no-query-modules.patch
