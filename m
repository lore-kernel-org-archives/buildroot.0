From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Apr 2015 22:27:33 +0200
Subject: [Buildroot] [git commit] perl-libwww: remove hash file
Message-ID: <20150420202825.D696A81D4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb77a3d6c64477182cc766dbf2f20aad2f59d8e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Romain Naour, having a hash file for a package
downloaded from github is wrong.

Reported-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-libwww/perl-libwww.hash |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/perl-libwww/perl-libwww.hash b/package/perl-libwww/perl-libwww.hash
deleted file mode 100644
index 1ef5ccf..0000000
--- a/package/perl-libwww/perl-libwww.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5    85b36bcd2fd2450718ee14f894f0d3d1 libwww-perl-6.13.tar.gz
-sha256 5fbd13eebd1933e5a203fceb2c1629efbccff3efc8fab6ec0285c79d0a95f8b2 libwww-perl-6.13.tar.gz
