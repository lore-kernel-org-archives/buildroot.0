From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Thu,  5 Jul 2018 09:56:50 +0200
Subject: [Buildroot] [PATCHv2 0/3] misc patches from Nokia
Message-ID: <20180705075653.27758-1-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

As promised earlier this year, here is a first set of patches from our local
tree. More will come later.

They are grouped in one series, but only the two dropbear patches actually
are linked.

Best regards,
Thomas

---

v2:
- drop dropbear patches, better alternative is in patchwork
- pigz: add DEVELOPERS entry and update download URL


Alfredo Alvarez Fernandez (1):
  pigz: new package

Jan Heylen (1):
  linux: automatically set CONFIG_PERF_EVENTS when perf is enabled

Thomas De Schampheleire (1):
  host zstd: additionally build binary and make selectable

 DEVELOPERS                    |  1 +
 linux/linux.mk                |  2 ++
 package/Config.in             |  1 +
 package/Config.in.host        |  1 +
 package/linux-tools/Config.in |  8 +++++---
 package/pigz/Config.in        | 14 ++++++++++++++
 package/pigz/pigz.hash        |  2 ++
 package/pigz/pigz.mk          | 21 +++++++++++++++++++++
 package/zstd/Config.in.host   |  8 ++++++++
 package/zstd/zstd.mk          |  4 ++++
 10 files changed, 59 insertions(+), 3 deletions(-)
 create mode 100644 package/pigz/Config.in
 create mode 100644 package/pigz/pigz.hash
 create mode 100644 package/pigz/pigz.mk
 create mode 100644 package/zstd/Config.in.host

-- 
2.16.4
