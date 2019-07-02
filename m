From: John Faith <jfaith@impinj.com>
Date: Tue, 2 Jul 2019 20:43:11 +0000
Subject: [Buildroot] [PATCH v2 0/1] package/sdbusplus: new package
Message-ID: <20190702204247.12804-1-jfaith@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks to Arnout Vandecappelle for his detailed feedback.

This second version hopefully addresses all proposed changes, but the
one thing I did not do was adding Trent Piepho to DEVELOPERS by his
request. 

,
John

Trent Piepho (1):
  package/sdbusplus: new package

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/Config.in.host                        |  1 +
 ...x-example-build-with-disable-sdbuspp.patch | 42 +++++++++++++++++++
 package/sdbusplus/Config.in                   | 10 +++++
 package/sdbusplus/Config.in.host              | 10 +++++
 package/sdbusplus/sdbusplus.hash              |  4 ++
 package/sdbusplus/sdbusplus.mk                | 21 ++++++++++
 8 files changed, 90 insertions(+)
 create mode 100644 package/sdbusplus/0001-build-Fix-example-build-with-disable-sdbuspp.patch
 create mode 100644 package/sdbusplus/Config.in
 create mode 100644 package/sdbusplus/Config.in.host
 create mode 100644 package/sdbusplus/sdbusplus.hash
 create mode 100644 package/sdbusplus/sdbusplus.mk

-- 
2.19.1
