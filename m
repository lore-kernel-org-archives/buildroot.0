From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2015 20:09:41 +0100
Subject: [Buildroot] [PATCH 1/8 v8] package/xserver_xorg-server: prepare for
	multiple supported versions
In-Reply-To: <cover.1426360000.git.yann.morin.1998@free.fr>
References: <cover.1426360000.git.yann.morin.1998@free.fr>
Message-ID: <222c96ce8a8b9292bd3fd9426db65bb524ce079d.1426360000.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simply move patch around...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../0001-backtrace.c-Fix-word-cast-to-a-pointer.patch}                    | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/x11r7/xserver_xorg-server/{0004-backtrace.c-Fix-word-cast-to-a-pointer.patch => 1.17.1/0001-backtrace.c-Fix-word-cast-to-a-pointer.patch} (100%)

diff --git a/package/x11r7/xserver_xorg-server/0004-backtrace.c-Fix-word-cast-to-a-pointer.patch b/package/x11r7/xserver_xorg-server/1.17.1/0001-backtrace.c-Fix-word-cast-to-a-pointer.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/0004-backtrace.c-Fix-word-cast-to-a-pointer.patch
rename to package/x11r7/xserver_xorg-server/1.17.1/0001-backtrace.c-Fix-word-cast-to-a-pointer.patch
-- 
1.9.1
