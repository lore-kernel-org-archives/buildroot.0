From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Mon, 14 Sep 2015 15:51:32 +0530
Subject: [Buildroot] [PATCH 0/3] new packages gssdp, gupnp and gupnp-av
Message-ID: <1442226095-4316-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series of patch adds three new packages gssdp, gupnp and
gupnp-av.

Rahul Bedarkar (3):
  gssdp: new package
  gupnp: new package
  gupnp-av: new package

 package/Config.in              |  3 +++
 package/gssdp/Config.in        | 15 +++++++++++++++
 package/gssdp/gssdp.hash       |  2 ++
 package/gssdp/gssdp.mk         | 15 +++++++++++++++
 package/gupnp-av/Config.in     | 17 +++++++++++++++++
 package/gupnp-av/gupnp-av.hash |  2 ++
 package/gupnp-av/gupnp-av.mk   | 15 +++++++++++++++
 package/gupnp/Config.in        | 20 ++++++++++++++++++++
 package/gupnp/gupnp.hash       |  2 ++
 package/gupnp/gupnp.mk         | 15 +++++++++++++++
 10 files changed, 106 insertions(+)
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
