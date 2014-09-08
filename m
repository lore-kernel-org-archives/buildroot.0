From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon,  8 Sep 2014 10:32:42 +0400
Subject: [Buildroot] [PATCH 0/2] add more dependencies on atomic operations
Message-ID: <1410157964-8422-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

More packages were discovered to use atomic operatoins.
With this series dependencies are applied to libraries that use atomic
operations and packages that explicitly select mentioned libraries.

Alexey Brodkin (2):
  libtirpc: add dependency on atomic operations
  zeromq: add dependency on atomic operations

 package/argus/Config.in           | 1 +
 package/conntrack-tools/Config.in | 1 +
 package/cppzmq/Config.in          | 1 +
 package/czmq/Config.in            | 1 +
 package/filemq/Config.in          | 1 +
 package/libtirpc/Config.in        | 1 +
 package/lmbench/Config.in         | 1 +
 package/mongrel2/Config.in        | 1 +
 package/nfs-utils/Config.in       | 1 +
 package/php-zmq/Config.in         | 1 +
 package/python-pyzmq/Config.in    | 1 +
 package/quota/Config.in           | 1 +
 package/rpcbind/Config.in         | 1 +
 package/zeromq/Config.in          | 1 +
 package/zmqpp/Config.in           | 1 +
 package/zyre/Config.in            | 1 +
 16 files changed, 16 insertions(+)

-- 
1.9.3
