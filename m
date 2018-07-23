From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Mon, 23 Jul 2018 22:06:25 +0200
Subject: [Buildroot] [PATCH 0/3] perl-net-ssh2 fixes
Message-ID: <20180723200628.2256-1-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These are three related fixes to perl-net-ssh2 detected in order to fix
autobuild issue
http://autobuild.buildroot.net/results/6ee18e7dd17f168c52f79e49cb5e94cf3aa3df1a/

Best regards,
Thomas

Thomas De Schampheleire (3):
  perl-net-ssh2: add missing dependency on zlib
  perl-net-ssh2: avoid build system inspecting host paths
  perl-net-ssh2: add support for libgcrypt crypto backend

 package/perl-net-ssh2/Config.in        |  9 ++++++++-
 package/perl-net-ssh2/perl-net-ssh2.mk | 10 +++++++++-
 2 files changed, 17 insertions(+), 2 deletions(-)

-- 
2.16.4
