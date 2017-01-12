From: William A. Kennington III <wak@google.com>
Date: Thu, 12 Jan 2017 11:15:20 -0800
Subject: [Buildroot] [PATCH v2 0/3] pblog: new package
In-Reply-To: <20161209011313.9549-1-wak@google.com>
References: <20161209011313.9549-1-wak@google.com>
Message-ID: <20170112191523.23814-1-wak@google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the pblog package and all dependencies needed for building.

William A. Kennington III (3):
  python-protobuf: Allow host building
  nanopb: new package
  pblog: new package

 package/Config.in                          |  2 ++
 package/nanopb/Config.in                   |  8 +++++++
 package/nanopb/nanopb.hash                 |  2 ++
 package/nanopb/nanopb.mk                   | 25 ++++++++++++++++++++++
 package/pblog/Config.in                    |  8 +++++++
 package/pblog/pblog.hash                   |  2 ++
 package/pblog/pblog.mk                     | 34 ++++++++++++++++++++++++++++++
 package/python-protobuf/python-protobuf.mk |  1 +
 8 files changed, 82 insertions(+)
 create mode 100644 package/nanopb/Config.in
 create mode 100644 package/nanopb/nanopb.hash
 create mode 100644 package/nanopb/nanopb.mk
 create mode 100644 package/pblog/Config.in
 create mode 100644 package/pblog/pblog.hash
 create mode 100644 package/pblog/pblog.mk

-- 
2.11.0
