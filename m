From: Grzegorz Blach <grzegorz@blach.pl>
Date: Thu, 14 Mar 2019 21:18:49 +0100
Subject: [Buildroot] [PATCH 0/1] Fixed package/python-aioblescan
Message-ID: <20190314201850.1021-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yesterday I sent a patch with wrong package name in commit message.
Of course this should be 'python-aioblescan' instead of 'aioblescan'.
This is fixed one.

Grzegorz Blach (1):
  package/python-aioblescan: new package

 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-aioblescan/Config.in              |  7 +++++++
 package/python-aioblescan/python-aioblescan.hash |  5 +++++
 package/python-aioblescan/python-aioblescan.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-aioblescan/Config.in
 create mode 100644 package/python-aioblescan/python-aioblescan.hash
 create mode 100644 package/python-aioblescan/python-aioblescan.mk

-- 
2.20.1
