From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  4 May 2020 15:20:02 +0200
Subject: [Buildroot] [PATCH v2 0/2] efl version bump to 1.24.0
Message-ID: <20200504132004.3166916-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A previous version bump to 1.23.3 was posted long time ago [1] but since
then efl 1.24.0 has been released.

Provide the version bump using two patches since the first patch switch
the build system to meson and the second patch change some other options
dependencies. This is indented to ease the review.

The series can be merged as is or by squashing them into one commit.

[1] http://patchwork.ozlabs.org/project/buildroot/patch/20200104011453.516356-1-romain.naour at gmail.com/

Romain Naour (2):
  package/efl: bump to version 1.23.3
  package/efl: bump to version 1.24.0

 Config.in.legacy                              |  18 ++
 ...EINA_VALUE_EMPTY-during-library-init.patch |  51 ---
 package/efl/Config.in                         |  42 +--
 package/efl/efl.hash                          |  22 +-
 package/efl/efl.mk                            | 301 ++++++++----------
 package/enlightenment/Config.in               |   1 -
 6 files changed, 175 insertions(+), 260 deletions(-)
 delete mode 100644 package/efl/0001-eina-set-EINA_VALUE_EMPTY-during-library-init.patch

-- 
2.25.4
