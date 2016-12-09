From: William A. Kennington III <wak@google.com>
Date: Thu,  8 Dec 2016 17:13:10 -0800
Subject: [Buildroot] [PATCH 0/3] pblog: Add new package
Message-ID: <20161209011313.9549-1-wak@google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset add the necessary dependencies for pblog and
adds the pblog package.

Google-Bug-Id: 33072942
Change-Id: Ia94c21096365e5b661804bcd84ed644621ed4123
Signed-off-by: William A. Kennington III <wak@google.com>

William A. Kennington III (3):
   python-protobuf: Allow host building
   nanopb: Init at 69e9c1fc8162956feffa32e07a97c53bdb92f5ef
   pblog: Init at e2e17544950eedac4f3bc59926aed8604d755072

  package/Config.in                          |  2 ++
  package/nanopb/Config.in                   |  8 ++++++++
  package/nanopb/nanopb.hash                 |  2 ++
  package/nanopb/nanopb.mk                   | 27 +++++++++++++++++++++++++++
  package/pblog/Config.in                    |  8 ++++++++
  package/pblog/pblog.hash                   |  2 ++
  package/pblog/pblog.mk                     | 27 +++++++++++++++++++++++++++
  package/python-protobuf/python-protobuf.mk |  1 +
  8 files changed, 77 insertions(+)
  create mode 100644 package/nanopb/Config.in
  create mode 100644 package/nanopb/nanopb.hash
  create mode 100644 package/nanopb/nanopb.mk
  create mode 100644 package/pblog/Config.in
  create mode 100644 package/pblog/pblog.hash
  create mode 100644 package/pblog/pblog.mk

-- 
2.8.0.rc3.226.g39d4020
