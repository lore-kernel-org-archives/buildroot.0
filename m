From: Jeroen Roovers <jer@airfi.aero>
Date: Thu,  3 Nov 2016 13:56:13 +0100
Subject: [Buildroot] [PATCH v2 0/2] libcurl: Incorrect fix for CVE-2016-8625
Message-ID: <20161103125615.21592-1-jer@airfi.aero>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2016-8625 was fixed by switching from libidn to libidn2.

Jeroen Roovers (2):
  libidn2: new package
  libcurl: Use libidn2 instead of libidn 

 package/Config.in            |  1 +
 package/libcurl/libcurl.mk   |  2 +-
 package/libidn2/Config.in    |  4 ++++
 package/libidn2/libidn2.hash |  2 ++
 package/libidn2/libidn2.mk   | 11 +++++++++++
 5 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 package/libidn2/Config.in
 create mode 100644 package/libidn2/libidn2.hash
 create mode 100644 package/libidn2/libidn2.mk

-- 
2.10.2
