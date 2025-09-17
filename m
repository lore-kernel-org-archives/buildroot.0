Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA1ECAC5A5
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 16:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 594DA61194;
	Wed, 17 Sep 2025 16:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLdKRMUHeCGU; Wed, 17 Sep 2025 16:45:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B432611D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B432611D4;
	Wed, 17 Sep 2025 16:45:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE0D8199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4997842A3
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o9g88m92U263 for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 16:45:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C688842A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C688842A9
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 577E0851CA; Wed, 17 Sep 2025 16:45:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Sep 2025 18:42:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44e0ba2bd256b269b578e64e0ebb0ab386bdf51d
X-Git-Newrev: c95f07d59ae6384f4c1e84c41d1742d60a0a4476
X-Patchwork-Hint: ignore
Message-Id: <20250917164533.577E0851CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gobject: bump to version
 3.54.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c95f07d59ae6384f4c1e84c41d1742d60a0a4476
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to formatting changes:
https://gitlab.gnome.org/GNOME/pygobject/-/commit/e80a612fd78c46c97a9d1f1bb29dc93344e24aba

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...Selector.get_map-look-up-file-objects-by-.patch | 164 ---------------------
 package/python-gobject/python-gobject.hash         |   6 +-
 package/python-gobject/python-gobject.mk           |   4 +-
 3 files changed, 5 insertions(+), 169 deletions(-)

diff --git a/package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch b/package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch
deleted file mode 100644
index a275abd9c7..0000000000
--- a/package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-From 4b97688d527276fc1e835fed71dbb73bbd09ac11 Mon Sep 17 00:00:00 2001
-From: Fiona Klute <fiona.klute@gmx.de>
-Date: Tue, 25 Mar 2025 13:29:04 +0100
-Subject: [PATCH] gi.events._Selector.get_map(): look up file objects by file
- descriptor
-
-File objects and their underlying file descriptors must be treated as
-equivalent for lookup, or one may incorrectly be treated as not
-registered when the other was used for the registration, leading to
-bugs.
-
-Fixes: #689
-Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
-Upstream: https://gitlab.gnome.org/GNOME/pygobject/-/commit/4b97688d527276fc1e835fed71dbb73bbd09ac11
----
- gi/events.py         | 36 +++++++++++++++++++++-----
- tests/test_events.py | 61 ++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 90 insertions(+), 7 deletions(-)
-
-diff --git a/gi/events.py b/gi/events.py
-index da4775dc..9eba1629 100644
---- a/gi/events.py
-+++ b/gi/events.py
-@@ -28,6 +28,7 @@ import threading
- import selectors
- import weakref
- import warnings
-+from collections.abc import Mapping
- from contextlib import contextmanager
- from . import _ossighelper
- 
-@@ -508,9 +509,33 @@ if sys.platform != 'win32':
-         # Subclass to attach _tag
-         pass
- 
-+    class _FileObjectMapping(Mapping):
-+        def __init__(self, fd_dict):
-+            self.fd_dict = fd_dict
-+
-+        def __len__(self):
-+            return len(self.fd_dict)
-+
-+        def get(self, fileobj, default=None):
-+            fd = _fileobj_to_fd(fileobj)
-+            return self.fd_dict.get(fd, default)
-+
-+        def __getitem__(self, fileobj):
-+            value = self.get(fileobj)
-+            if value is None:
-+                raise KeyError("{!r} is not registered".format(fileobj))
-+            return value
-+
-+        def __iter__(self):
-+            return iter(self.fd_dict)
-+
-     class _Selector(_SelectorMixin, selectors.BaseSelector):
-         """A Selector for gi.events.GLibEventLoop registering python IO with GLib."""
- 
-+        def __init__(self, context, loop):
-+            super().__init__(context, loop)
-+            self._map = _FileObjectMapping(self._fd_to_key)
-+
-         def attach(self):
-             self._source.attach(self._loop._context)
- 
-@@ -559,15 +584,12 @@ if sys.platform != 'win32':
-         # We could override modify, but it is only slightly when the "events" change.
- 
-         def get_key(self, fileobj):
--            fd = _fileobj_to_fd(fileobj)
--            return self._fd_to_key[fd]
-+            return self._map[fileobj]
- 
-         def get_map(self):
--            """Return a mapping of file objects to selector keys."""
--            # Horribly inefficient
--            # It should never be called and exists just to prevent issues if e.g.
--            # python decides to use it for debug purposes.
--            return {k.fileobj: k for k in self._fd_to_key.values()}
-+            """Return a mapping of file objects or file descriptors to
-+            selector keys."""
-+            return self._map
- 
- 
- else:
-diff --git a/tests/test_events.py b/tests/test_events.py
-index a6585468..9dbf3827 100644
---- a/tests/test_events.py
-+++ b/tests/test_events.py
-@@ -46,6 +46,7 @@ import sys
- import gi
- import gi.events
- import asyncio
-+import socket
- import threading
- from gi.repository import GLib, Gio
- 
-@@ -344,3 +345,63 @@ class GLibEventLoopPolicyTests(unittest.TestCase):
-         self.assertEqual(order, [GLib.PRIORITY_HIGH] * 3 +
-                                 [GLib.PRIORITY_DEFAULT] * 3 +
-                                 [GLib.PRIORITY_DEFAULT_IDLE] * 3)
-+
-+    @unittest.skipIf(sys.platform == 'win32', 'add reader/writer not implemented')
-+    def test_source_fileobj_fd(self):
-+        """Regression test for
-+        https://gitlab.gnome.org/GNOME/pygobject/-/issues/689
-+        """
-+        class Echo:
-+            def __init__(self, sock, expect_bytes):
-+                self.sock = sock
-+                self.sent_bytes = 0
-+                self.expect_bytes = expect_bytes
-+                self.done = asyncio.Future()
-+                self.data = bytes()
-+
-+            def send(self):
-+                if self.done.done():
-+                    return
-+                if self.sent_bytes < len(self.data):
-+                    self.sent_bytes += self.sock.send(
-+                        self.data[self.sent_bytes:])
-+                    print('sent', self.data)
-+                if self.sent_bytes >= self.expect_bytes:
-+                    self.done.set_result(None)
-+                    self.sock.shutdown(socket.SHUT_WR)
-+
-+            def recv(self):
-+                if self.done.done():
-+                    return
-+                self.data += self.sock.recv(self.expect_bytes)
-+                print('received', self.data)
-+                if len(self.data) >= self.expect_bytes:
-+                    self.sock.shutdown(socket.SHUT_RD)
-+
-+        async def run():
-+            loop = asyncio.get_running_loop()
-+            s1, s2 = socket.socketpair()
-+            sample = b'Hello!'
-+            e = Echo(s1, len(sample))
-+            # register using file object and file descriptor
-+            loop.add_reader(s1, e.recv)
-+            loop.add_writer(s1.fileno(), e.send)
-+            s2.sendall(sample)
-+            await asyncio.wait_for(e.done, timeout=2.0)
-+            echo = bytes()
-+            for _ in range(len(sample)):
-+                echo += s2.recv(len(sample))
-+                if len(echo) == len(sample):
-+                    break
-+            # remove using file object and file descriptor
-+            loop.remove_reader(s1)
-+            loop.remove_writer(s1.fileno())
-+            s1.close()
-+            s2.close()
-+            # check if the data was echoed correctly
-+            self.assertEqual(sample, echo)
-+
-+        policy = self.create_policy()
-+        loop = policy.get_event_loop()
-+        loop.run_until_complete(run())
-+        loop.close()
--- 
-2.49.0
-
diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index e49c7ddd08..be19fc1900 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from https://download.gnome.org/sources/pygobject/3.52/pygobject-3.52.3.sha256sum
-sha256  00e427d291e957462a8fad659a9f9c8be776ff82a8b76bdf402f1eaeec086d82  pygobject-3.52.3.tar.gz
-sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
+# from https://download.gnome.org/sources/pygobject/3.54/pygobject-3.54.2.sha256sum
+sha256  03cffeb49d8a1879b621d8f606ac904218019a0ae699b1cd3780a8ee611e696b  pygobject-3.54.2.tar.gz
+sha256  f4cac31434b287b10a70b81c62cfa973d250417f8f248c4c1b5566d061ecfb2f  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index 3021937887..0d96c299cf 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_GOBJECT_VERSION_MAJOR = 3.52
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).3
+PYTHON_GOBJECT_VERSION_MAJOR = 3.54
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).2
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.gz
 PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
