From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 15 Jul 2012 22:59:25 -0400
Subject: [Buildroot] (no subject)
Message-ID: <1342407566-2819-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


---

v2: remove "depends on BR2_PACKAGE_LUA_SHARED_LIBRARY", since this           
dependency against Lua is implicit, because of the sub menu for 
Lua packages in package/Config.in.
