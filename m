From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 24 Feb 2014 10:50:02 +0100
Subject: [Buildroot] [PATCH 0/2] improve virtual package infra
Message-ID: <1393235404-2693-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series, intended for the -next branch, improves virtual package
infrastructure by:

- using make control functions in dependency check.
- adding a tutorial to the user manual.

Best regards,
ELB

Eric Le Bihan (2):
  infra: improve dependency check in virtual packages.
  manual: add virtual package tutorial.

 docs/manual/adding-packages-virtual.txt  |  102 ++++++++++++++++++++++++++++++
 docs/manual/adding-packages.txt          |    2 +
 package/luainterpreter/luainterpreter.mk |    6 ++
 package/opengl/libegl/libegl.mk          |    7 +-
 package/opengl/libgles/libgles.mk        |    7 +-
 package/opengl/libopenmax/libopenmax.mk  |    7 +-
 package/opengl/libopenvg/libopenvg.mk    |    7 +-
 package/powervr/powervr.mk               |    7 +-
 8 files changed, 125 insertions(+), 20 deletions(-)
 create mode 100644 docs/manual/adding-packages-virtual.txt

--
1.7.9.5
