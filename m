From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:24:10 +0200
Subject: [Buildroot] [git commit] package/xserver_xorg-server: prepare for
	multiple supported versions
Message-ID: <20150426202424.D59C381734@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa83978b1fdc20ba06e7cb8249227bb3e6c76f0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Simply move patch around...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...1-backtrace.c-Fix-word-cast-to-a-pointer.patch} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/0004-backtrace.c-Fix-word-cast-to-a-pointer.patch b/package/x11r7/xserver_xorg-server/1.17.1/0001-backtrace.c-Fix-word-cast-to-a-pointer.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/0004-backtrace.c-Fix-word-cast-to-a-pointer.patch
rename to package/x11r7/xserver_xorg-server/1.17.1/0001-backtrace.c-Fix-word-cast-to-a-pointer.patch
