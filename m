From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Jun 2019 20:12:43 -0000
Subject: [Buildroot] [git commit] package/redis: bump to 5.0.4
Message-ID: <20190602201233.71889800FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ee03e29cf984fb236e1a0923f12d8ea4213aaf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Redis 5 now supports reproducible builds via SOURCE_DATE_EPOCH
* Add myself to DEVELOPERS for Redis

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                      | 3 +++
 package/redis/0001-uclibc.patch | 9 ++++++---
 package/redis/redis.hash        | 2 +-
 package/redis/redis.mk          | 2 +-
 4 files changed, 11 insertions(+), 5 deletions(-)

Patch is too large, so refusing to show it
