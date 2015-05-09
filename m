From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat,  9 May 2015 10:41:26 +0200
Subject: [Buildroot] [PATCH 0/3] Mono: fixing latest build failures
Message-ID: <1431160889-3851-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series should fix the latest build failures for mono.

Fixes http://autobuild.buildroot.net/results/227/227f942107e4fcbc14bb1e7d97e1e2758d6f3f2d/

Angelo Compagnucci (3):
  package/mono: fixing mono version
  package/mono: adding hash file
  package/monolite: adding hash file

 package/mono/mono.hash         | 2 ++
 package/mono/mono.mk           | 2 +-
 package/monolite/monolite.hash | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)
 create mode 100644 package/mono/mono.hash
 create mode 100644 package/monolite/monolite.hash

-- 
1.9.1
