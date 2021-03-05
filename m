From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri,  5 Mar 2021 17:12:08 +0100
Subject: [Buildroot] [PATCH v2 0/3] Deal with binutils bug 21464
Message-ID: <20210305161211.4396-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce binutils bug which protobuf and zeromq package are affected and
disable them while suffering that bug.

Giulio Benetti (3):
  toolchain: introduce BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
  package/protobuf: disable package if binutils is affected from bug
    21464
  package/zeromq: disable package if binutils is affected from bug 21464

 package/protobuf/Config.in | 1 +
 package/zeromq/Config.in   | 2 ++
 toolchain/Config.in        | 6 ++++++
 3 files changed, 9 insertions(+)

-- 
2.25.1
