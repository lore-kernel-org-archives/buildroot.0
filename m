From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sat, 26 Oct 2019 18:22:17 +0200
Subject: [Buildroot] [PATCH 0/2] package/supervisor: bump version to run on
 Python3
Message-ID: <20191026162219.144819-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In our efforts to follow the Python2 deprecation, this patchset makes
Supervisor able to run on Python3. This feature appeared upstream since the v4

Titouan Christophe (2):
  package/supervisor: Bump to v4.1.0
  package/supervisor: can now run on Python 3

 package/supervisor/Config.in       | 5 +++--
 package/supervisor/supervisor.hash | 2 +-
 package/supervisor/supervisor.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.21.0
