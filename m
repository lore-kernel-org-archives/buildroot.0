From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Fri, 10 May 2019 10:35:03 +0200
Subject: [Buildroot] [PATCH v3 0/2] package/murata-cyw-fw: new package
Message-ID: <20190510083505.1341-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This is a next version of package with firmware for murata wireless modules
(WiFi + BLE). This version is based on feedback from v2 [1].

I have splitted it into two patches, because I am not sure that second patch
(reducing required files to download) is worth worse (in my opinion) user
experience when rebuilding with new options selected.

[1] http://lists.busybox.net/pipermail/buildroot/2019-May/249595.html

Marcin Niestroj (2):
  package/murata-cyw-fw: new package
  package/murata-cyw-fw: download NVRAM and BT_PATCH only when needed

 DEVELOPERS                               |   1 +
 package/Config.in                        |   1 +
 package/murata-cyw-fw/Config.in          |  97 ++++++++++++++++++++
 package/murata-cyw-fw/murata-cyw-fw.hash |   5 ++
 package/murata-cyw-fw/murata-cyw-fw.mk   | 107 +++++++++++++++++++++++
 5 files changed, 211 insertions(+)
 create mode 100644 package/murata-cyw-fw/Config.in
 create mode 100644 package/murata-cyw-fw/murata-cyw-fw.hash
 create mode 100644 package/murata-cyw-fw/murata-cyw-fw.mk

-- 
2.21.0
