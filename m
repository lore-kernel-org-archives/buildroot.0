From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Tue, 15 Sep 2015 13:34:38 +0530
Subject: [Buildroot] [PATCH v2 0/3] new packages gssdp, gupnp and gupnp-av
Message-ID: <1442304281-16222-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series of patch adds three new packages gssdp, gupnp and
gupnp-av.

Changes v1 -> v2:
	PATCH 1/3 - libsoup also needs threads and MMU so add it to list in comment
	          - add <PKG>-VERSION_MAJOR variable (suggested by Vincent Olivert Riera)
	PATCH 2/3 - gssdp also needs wchar, threads and MMU so add it to list in comment
	          - util-linux also needs wchar so add it to list in comment (suggested by Vincent Olivert Riera)
	          - add <PKG>-VERSION_MAJOR variable (suggested by Vincent Olivert Riera)
	PATCH 3/3 - gupnp also needs wchar, threads and MMU so add it to list in comment
	          - add <PKG>-VERSION_MAJOR variable (suggested by Vincent Olivert Riera)

Rahul Bedarkar (3):
  gssdp: new package
  gupnp: new package
  gupnp-av: new package

 package/Config.in              |  3 +++
 package/gssdp/Config.in        | 15 +++++++++++++++
 package/gssdp/gssdp.hash       |  2 ++
 package/gssdp/gssdp.mk         | 16 ++++++++++++++++
 package/gupnp-av/Config.in     | 17 +++++++++++++++++
 package/gupnp-av/gupnp-av.hash |  2 ++
 package/gupnp-av/gupnp-av.mk   | 16 ++++++++++++++++
 package/gupnp/Config.in        | 20 ++++++++++++++++++++
 package/gupnp/gupnp.hash       |  2 ++
 package/gupnp/gupnp.mk         | 16 ++++++++++++++++
 10 files changed, 109 insertions(+)
 create mode 100644 package/gssdp/Config.in
 create mode 100644 package/gssdp/gssdp.hash
 create mode 100644 package/gssdp/gssdp.mk
 create mode 100644 package/gupnp-av/Config.in
 create mode 100644 package/gupnp-av/gupnp-av.hash
 create mode 100644 package/gupnp-av/gupnp-av.mk
 create mode 100644 package/gupnp/Config.in
 create mode 100644 package/gupnp/gupnp.hash
 create mode 100644 package/gupnp/gupnp.mk

-- 
1.9.1
