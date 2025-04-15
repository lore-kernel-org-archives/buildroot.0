Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932F8C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 20:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 557C66069E;
	Tue, 15 Apr 2025 20:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvN3Xv46Z83l; Tue, 15 Apr 2025 20:05:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 134E160D80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 134E160D80;
	Tue, 15 Apr 2025 20:05:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0F05109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D64B641790
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B8bbjkhgsMdQ for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 20:05:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B87340B8A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B87340B8A
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:05:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9326284AA1; Tue, 15 Apr 2025 20:05:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 22:00:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ffdf75311ab6eb0ed6018556bc0212966ea95eb
X-Git-Newrev: b612b90238d729b9f74cdb52d8de3a9a2bd50194
X-Patchwork-Hint: ignore
Message-Id: <20250415200545.9326284AA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igh-ethercat: bump to version 1.6.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1106013454452650404=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1106013454452650404==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b612b90238d729b9f74cdb52d8de3a9a2bd50194
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes between 1.6.2 and 1.6.3:

805e407f6f1f723023f06d9a3e7e0b8a23b023f7 (HEAD, tag: 1.6.3) Merge branch 'version-1.6.3' into 'stable-1.6'
11504f3a0f24bcaec4191ef3fc4c8d4c8c942bd1 Version bump to 1.6.3.
e2129f7794a9bbc4d9c4385d84d33a3b1a6739a4 Merge branch 'genet-6.12' into 'stable-1.6'
5b3663e15bcea8050a2a45adb2c3c0ade4f17d96 Merge branch 'fake_without_domain' into 'stable-1.6'
d15936b8b5cf3096251b6118dfd0a069b6ba88b6 Merge branch 'fix_ccat_aarch64' into 'stable-1.6'
dab517b9cab6ec7328af166026359d32735914d8 Merge branch 'tty-module-fixes' into 'stable-1.6'
fa7c40b63e6025eb4d9261f5e10611e0e6fafe57 Merge branch 'fix_warnings' into 'stable-1.6'
d06a18f934aac931e4dff37703e0f646e3088bb8 Fix -Wold-style-declaration.
60dd4f94eca2b2a0007523e6955faf48ba81990e Fix -Wmissing-prototypes
c2cbfa5b93439cd7f742870d8f4fe234af8f7c98 [FEAT] add genet device driver for kernel 6.12
de9efb77700b2cd055f8f4dd49827d1ee34fc093 Fix ccat for aarch64 >= 6.11.0
2824232792364140569d522627b48a64e5d3a690 tty/module.c: fix ec_tty_send_xchar() prototype for Linux >= 6.8
27175946c4ea55a426cdcdc1278a7d7c433d2a57 tty/module.c: fix ec_tty_write() prototype for Linux >= 6.6
aed3ba0acb2c355be562cfbdb3a375682412c144 tty/module.c: mark internal functions as static
c117849d02cf53b7fe338c39798b6e3b81b3a812 Removed FAKE_EC_DOMAIN_PERMUTATION.
5ae76628930094caed35c58dc2099b241e7d82a6 Removed domain permutation from documentation; fixed some typos.
2e9101da99b18700e23587e04751050cf07de632 Remove domain information from  RtIPC path.
ca66cd6ae9b821bfbec6d68ee1b43da359c5894c Merge branch 'remove-inline-statement' into 'stable-1.6'
5802c72818df07d34469630a8943915cce738626 Remove unnecessary inline statement causing build -O0 problems

Patch 0001-tty-module.c-mark-internal-functions-as-static.patch merged
upstream as of aed3ba0acb2c355be562cfbdb3a375682412c144.

Patch 0002-tty-module.c-fix-ec_tty_write-prototype-for-Linux-6..patch
merged upstream as of 27175946c4ea55a426cdcdc1278a7d7c433d2a57.

Patch 0003-tty-module.c-fix-ec_tty_send_xchar-prototype-for-Lin.patch
merged upstream as of 2824232792364140569d522627b48a64e5d3a690.

Patch 0004-Remove-unnecessary-inline-statement-causing-build-O0.patch
merged upstream as of 5802c72818df07d34469630a8943915cce738626.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...odule.c-mark-internal-functions-as-static.patch | 154 ---------------------
 ...c-fix-ec_tty_write-prototype-for-Linux-6..patch |  58 --------
 ...c-fix-ec_tty_send_xchar-prototype-for-Lin.patch |  50 -------
 ...cessary-inline-statement-causing-build-O0.patch |  38 -----
 package/igh-ethercat/igh-ethercat.hash             |   2 +-
 package/igh-ethercat/igh-ethercat.mk               |   2 +-
 6 files changed, 2 insertions(+), 302 deletions(-)

diff --git a/package/igh-ethercat/0001-tty-module.c-mark-internal-functions-as-static.patch b/package/igh-ethercat/0001-tty-module.c-mark-internal-functions-as-static.patch
deleted file mode 100644
index 5d6dd6b9b6..0000000000
--- a/package/igh-ethercat/0001-tty-module.c-mark-internal-functions-as-static.patch
+++ /dev/null
@@ -1,154 +0,0 @@
-From aed3ba0acb2c355be562cfbdb3a375682412c144 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Tue, 31 Dec 2024 10:28:41 +0100
-Subject: [PATCH] tty/module.c: mark internal functions as static
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-
-/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:128:12: warning: no previous prototype for â€˜ec_tty_init_moduleâ€™ [-Wmissing-prototypes]
-  128 | int __init ec_tty_init_module(void)
-      |            ^~~~~~~~~~~~~~~~~~
-/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:189:13: warning: no previous prototype for â€˜ec_tty_cleanup_moduleâ€™ [-Wmissing-prototypes]
-  189 | void __exit ec_tty_cleanup_module(void)
-      |             ^~~~~~~~~~~~~~~~~~~~~
-/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:216:5: warning: no previous prototype for â€˜ec_tty_initâ€™ [-Wmissing-prototypes]
-  216 | int ec_tty_init(ec_tty_t *t, int minor,
-      |     ^~~~~~~~~~~
-/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:293:6: warning: no previous prototype for â€˜ec_tty_clearâ€™ [-Wmissing-prototypes]
-  293 | void ec_tty_clear(ec_tty_t *tty)
-      |      ^~~~~~~~~~~~
-/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:301:14: warning: no previous prototype for â€˜ec_tty_tx_sizeâ€™ [-Wmissing-prototypes]
-  301 | unsigned int ec_tty_tx_size(ec_tty_t *tty)
-      |              ^~~~~~~~~~~~~~
-/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:316:14: warning: no previous prototype for â€˜ec_tty_tx_spaceâ€™ [-Wmissing-prototypes]
-  316 | unsigned int ec_tty_tx_space(ec_tty_t *tty)
-      |              ^~~~~~~~~~~~~~~
-/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:323:14: warning: no previous prototype for â€˜ec_tty_rx_sizeâ€™ [-Wmissing-prototypes]
-  323 | unsigned int ec_tty_rx_size(ec_tty_t *tty)
-      |              ^~~~~~~~~~~~~~
-/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:338:14: warning: no previous prototype for â€˜ec_tty_rx_spaceâ€™ [-Wmissing-prototypes]
-  338 | unsigned int ec_tty_rx_space(ec_tty_t *tty)
-      |              ^~~~~~~~~~~~~~~
-/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:345:5: warning: no previous prototype for â€˜ec_tty_get_serial_infoâ€™ [-Wmissing-prototypes]
-  345 | int ec_tty_get_serial_info(ec_tty_t *tty, struct serial_struct *data)
-      |     ^~~~~~~~~~~~~~~~~~~~~~
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://gitlab.com/etherlab.org/ethercat/-/merge_requests/150
----
- tty/module.c | 26 +++++++++++++-------------
- 1 file changed, 13 insertions(+), 13 deletions(-)
-
-diff --git a/tty/module.c b/tty/module.c
-index 05486940..af4c1b70 100644
---- a/tty/module.c
-+++ b/tty/module.c
-@@ -64,9 +64,9 @@ ec_tty_t *ttys[EC_TTY_MAX_DEVICES];
- struct semaphore tty_sem;
- 
- #if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0)
--void ec_tty_wakeup(struct timer_list *);
-+static void ec_tty_wakeup(struct timer_list *);
- #else
--void ec_tty_wakeup(unsigned long);
-+static void ec_tty_wakeup(unsigned long);
- #endif
- 
- /****************************************************************************/
-@@ -125,7 +125,7 @@ static const struct tty_operations ec_tty_ops; // see below
-  *
-  * \return 0 on success, else < 0
-  */
--int __init ec_tty_init_module(void)
-+static int __init ec_tty_init_module(void)
- {
-     int i, ret = 0;
-     unsigned flags = TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV;
-@@ -186,7 +186,7 @@ out_return:
-  *
-  * Clears all master instances.
-  */
--void __exit ec_tty_cleanup_module(void)
-+static void __exit ec_tty_cleanup_module(void)
- {
- #if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 7, 0)
-     int i;
-@@ -213,7 +213,7 @@ void __exit ec_tty_cleanup_module(void)
-  * ec_tty_t methods.
-  ****************************************************************************/
- 
--int ec_tty_init(ec_tty_t *t, int minor,
-+static int ec_tty_init(ec_tty_t *t, int minor,
-         const ec_tty_operations_t *ops, void *cb_data)
- {
-     int ret;
-@@ -290,7 +290,7 @@ int ec_tty_init(ec_tty_t *t, int minor,
- 
- /****************************************************************************/
- 
--void ec_tty_clear(ec_tty_t *tty)
-+static void ec_tty_clear(ec_tty_t *tty)
- {
-     del_timer_sync(&tty->timer);
-     tty_unregister_device(tty_driver, tty->minor);
-@@ -298,7 +298,7 @@ void ec_tty_clear(ec_tty_t *tty)
- 
- /****************************************************************************/
- 
--unsigned int ec_tty_tx_size(ec_tty_t *tty)
-+static unsigned int ec_tty_tx_size(ec_tty_t *tty)
- {
-     unsigned int ret;
- 
-@@ -313,14 +313,14 @@ unsigned int ec_tty_tx_size(ec_tty_t *tty)
- 
- /****************************************************************************/
- 
--unsigned int ec_tty_tx_space(ec_tty_t *tty)
-+static unsigned int ec_tty_tx_space(ec_tty_t *tty)
- {
-     return EC_TTY_TX_BUFFER_SIZE - 1 - ec_tty_tx_size(tty);
- }
- 
- /****************************************************************************/
- 
--unsigned int ec_tty_rx_size(ec_tty_t *tty)
-+static unsigned int ec_tty_rx_size(ec_tty_t *tty)
- {
-     unsigned int ret;
- 
-@@ -335,14 +335,14 @@ unsigned int ec_tty_rx_size(ec_tty_t *tty)
- 
- /****************************************************************************/
- 
--unsigned int ec_tty_rx_space(ec_tty_t *tty)
-+static unsigned int ec_tty_rx_space(ec_tty_t *tty)
- {
-     return EC_TTY_RX_BUFFER_SIZE - 1 - ec_tty_rx_size(tty);
- }
- 
- /****************************************************************************/
- 
--int ec_tty_get_serial_info(ec_tty_t *tty, struct serial_struct *data)
-+static int ec_tty_get_serial_info(ec_tty_t *tty, struct serial_struct *data)
- {
-     struct serial_struct tmp;
- 
-@@ -362,9 +362,9 @@ int ec_tty_get_serial_info(ec_tty_t *tty, struct serial_struct *data)
- /** Timer function.
-  */
- #if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0)
--void ec_tty_wakeup(struct timer_list *t)
-+static void ec_tty_wakeup(struct timer_list *t)
- #else
--void ec_tty_wakeup(unsigned long data)
-+static void ec_tty_wakeup(unsigned long data)
- #endif
- {
- #if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0)
--- 
-2.47.1
-
diff --git a/package/igh-ethercat/0002-tty-module.c-fix-ec_tty_write-prototype-for-Linux-6..patch b/package/igh-ethercat/0002-tty-module.c-fix-ec_tty_write-prototype-for-Linux-6..patch
deleted file mode 100644
index 78a444715e..0000000000
--- a/package/igh-ethercat/0002-tty-module.c-fix-ec_tty_write-prototype-for-Linux-6..patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 27175946c4ea55a426cdcdc1278a7d7c433d2a57 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Tue, 31 Dec 2024 10:35:38 +0100
-Subject: [PATCH] tty/module.c: fix ec_tty_write() prototype for Linux >= 6.6
-
-In upstream Linux kernel commits:
- 95713967ba52389f7cea75704d0cf048080ec218 ("tty: make tty_operations::write()'s count size_t")
- 69851e4ab8feeb369119a44ddca430c0ee15f0d8 ("tty: propagate u8 data to tty_operations::write()")
-
-The prototype of tty_operations->write() was changed from:
-
-       int  (*write)(struct tty_struct * tty,
-                     const unsigned char *buf, int count);
-
-to:
-
-       ssize_t (*write)(struct tty_struct *tty, const u8 *buf, size_t count);
-
-Both of those commits were merged in Linux 6.6, and this needs an
-update in tty/module.c to avoid the following build failure:
-
-/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:740:14: error: initialization of "ssize_t (*)(struct tty_struct *, const u8 *, size_t)" {aka "long int (*)(struct tty_struct *, const unsigned char *, long unsigned int)"} from incompatible pointer type "int (*)(struct tty_struct *, const unsigned char *, int)" [-Werror=incompatible-pointer-types]
-  740 |     .write = ec_tty_write,
-      |              ^~~~~~~~~~~~
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://gitlab.com/etherlab.org/ethercat/-/merge_requests/150
----
- tty/module.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/tty/module.c b/tty/module.c
-index af4c1b70..354ddfd6 100644
---- a/tty/module.c
-+++ b/tty/module.c
-@@ -488,11 +488,19 @@ static void ec_tty_close(struct tty_struct *tty, struct file *file)
- 
- /****************************************************************************/
- 
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 6, 0)
-+static ssize_t ec_tty_write(
-+        struct tty_struct *tty,
-+        const u8 *buffer,
-+        size_t count
-+        )
-+#else
- static int ec_tty_write(
-         struct tty_struct *tty,
-         const unsigned char *buffer,
-         int count
-         )
-+#endif
- {
-     ec_tty_t *t = (ec_tty_t *) tty->driver_data;
-     unsigned int data_size, i;
--- 
-2.47.1
-
diff --git a/package/igh-ethercat/0003-tty-module.c-fix-ec_tty_send_xchar-prototype-for-Lin.patch b/package/igh-ethercat/0003-tty-module.c-fix-ec_tty_send_xchar-prototype-for-Lin.patch
deleted file mode 100644
index 62662ee103..0000000000
--- a/package/igh-ethercat/0003-tty-module.c-fix-ec_tty_send_xchar-prototype-for-Lin.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 2824232792364140569d522627b48a64e5d3a690 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Tue, 31 Dec 2024 10:38:03 +0100
-Subject: [PATCH] tty/module.c: fix ec_tty_send_xchar() prototype for Linux >=
- 6.8
-
-In upstream Linux kernel commit:
-  3a00da027946cd08db1c1be2de4620950bbdf074 ("tty: make tty_operations::send_xchar accept u8 char")
-
-The prototype of tty_operations->send_xchar() was changed from:
-
-  void (*send_xchar)(struct tty_struct *tty, char ch);
-
-to:
-
-  void (*send_xchar)(struct tty_struct *tty, u8 ch);
-
-This commit was merged in Linux 6.8, and therefore the
-ec_tty_send_xchar() implementation needs to be changed to avoid the
-following build failure:
-
-/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:751:19: error: initialization of "void (*)(struct tty_struct *, u8)" {aka "void (*)(struct tty_struct *, unsigned char)"} from incompatible pointer type "void (*)(struct tty_struct *, char)" [-Werror=incompatible-pointer-types]
-  751 |     .send_xchar = ec_tty_send_xchar,
-      |                   ^~~~~~~~~~~~~~~~~
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://gitlab.com/etherlab.org/ethercat/-/merge_requests/150
----
- tty/module.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/tty/module.c b/tty/module.c
-index 354ddfd6..2b7b22bb 100644
---- a/tty/module.c
-+++ b/tty/module.c
-@@ -724,7 +724,11 @@ static int ec_tty_break(struct tty_struct *tty, int break_state)
- 
- /****************************************************************************/
- 
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 8, 0)
-+static void ec_tty_send_xchar(struct tty_struct *tty, u8 ch)
-+#else
- static void ec_tty_send_xchar(struct tty_struct *tty, char ch)
-+#endif
- {
- #if EC_TTY_DEBUG >= 2
-     printk(KERN_INFO PFX "%s(ch=%02x).\n", __func__, (unsigned int) ch);
--- 
-2.47.1
-
diff --git a/package/igh-ethercat/0004-Remove-unnecessary-inline-statement-causing-build-O0.patch b/package/igh-ethercat/0004-Remove-unnecessary-inline-statement-causing-build-O0.patch
deleted file mode 100644
index 2cbb9c3ce7..0000000000
--- a/package/igh-ethercat/0004-Remove-unnecessary-inline-statement-causing-build-O0.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 39d065d5fb56525c1171c4fcb643b798ee10c6b9 Mon Sep 17 00:00:00 2001
-From: Richard Hacker <ha@igh.de>
-Date: Mon, 18 Nov 2024 10:54:00 +0100
-Subject: [PATCH] Remove unnecessary inline statement causing build -O0
- problems
-
-Fixes #147
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://gitlab.com/etherlab.org/ethercat/-/commit/5802c72818df07d34469630a8943915cce738626
----
- lib/slave_config.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/lib/slave_config.c b/lib/slave_config.c
-index 7bef3a99..58d6c7b4 100644
---- a/lib/slave_config.c
-+++ b/lib/slave_config.c
-@@ -40,6 +40,7 @@
- void ec_slave_config_add_sdo_request(ec_slave_config_t *, ec_sdo_request_t *);
- void ec_slave_config_add_reg_request(ec_slave_config_t *, ec_reg_request_t *);
- void ec_slave_config_add_voe_handler(ec_slave_config_t *, ec_voe_handler_t *);
-+void ec_slave_config_add_soe_request(ec_slave_config_t *, ec_soe_request_t *);
- 
- /****************************************************************************/
- 
-@@ -625,7 +626,7 @@ ec_sdo_request_t *ecrt_slave_config_create_sdo_request(ec_slave_config_t *sc,
- 
- /****************************************************************************/
- 
--inline void ec_slave_config_add_soe_request(ec_slave_config_t *sc,
-+void ec_slave_config_add_soe_request(ec_slave_config_t *sc,
-         ec_soe_request_t *req)
- {
-     if (sc->first_soe_request) {
--- 
-2.47.1
-
diff --git a/package/igh-ethercat/igh-ethercat.hash b/package/igh-ethercat/igh-ethercat.hash
index c655f9ac79..daa9aca8d0 100644
--- a/package/igh-ethercat/igh-ethercat.hash
+++ b/package/igh-ethercat/igh-ethercat.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  6c8ce954f9c27de95ecce508fecfcc48767742f7cbbe967187dac6e817df2e70  igh-ethercat-1.6.2.tar.gz
+sha256  3fa09d623c2a9488bc6c40072b080ef719a4e78d89e30cc0ddbaabacd4875e37  igh-ethercat-1.6.3.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index 0fcba65cf5..1d93d473da 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGH_ETHERCAT_VERSION = 1.6.2
+IGH_ETHERCAT_VERSION = 1.6.3
 IGH_ETHERCAT_SITE = $(call gitlab,etherlab.org,ethercat,$(IGH_ETHERCAT_VERSION))
 IGH_ETHERCAT_LICENSE = GPL-2.0 (IgH EtherCAT master), LGPL-2.1 (libraries)
 IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER

--===============1106013454452650404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1106013454452650404==--
