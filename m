From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 31 Jul 2020 23:53:40 +0200
Subject: [Buildroot] [PATCH 0/5] package/systemd: make a couple dependencies
 optional
Message-ID: <20200731215345.19212-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the previous single patch split uo into several smaller ones #1-#4,
there are no changes in these.
One patch is added to disable the portabled option


Norbert Lange (5):
  package/systemd: import does not need bzip2 and lz4
  package/systemd: remove libblkid dependency
  package/systemd: remove util-linux binaries dependency
  package/systemd: remove util-linux nologin dependency
  package/systemd: disable portabled

 package/systemd/Config.in  |  5 -----
 package/systemd/systemd.mk | 16 ++++++++++++++--
 2 files changed, 14 insertions(+), 7 deletions(-)

--
2.27.0
