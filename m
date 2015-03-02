From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon,  2 Mar 2015 11:01:22 -0300
Subject: [Buildroot] [PATCH 0/1] gmock: new package
Message-ID: <1425304883-4332-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Warning: This change requires an updated recipe for gtest (submittted
as a separate patch) because Gmock requires the gtest-config, which is
installed only if gtest is built with autotools.

Carlos Santos (1):
  gmock: new package

 package/Config.in        |  1 +
 package/gmock/Config.in  | 26 ++++++++++++++++++++++++++
 package/gmock/gmock.hash |  3 +++
 package/gmock/gmock.mk   | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 77 insertions(+)
 create mode 100644 package/gmock/Config.in
 create mode 100644 package/gmock/gmock.hash
 create mode 100644 package/gmock/gmock.mk

-- 
1.8.3.1
