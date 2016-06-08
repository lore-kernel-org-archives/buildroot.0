From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 23:29:30 +0200
Subject: [Buildroot] [git commit] glibc: remove eglibc hashes
Message-ID: <20160608213020.2083481FCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34ba9eedd46e692d579573b8d360033bacb1841c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 500de2598a4902a0e9ec53f7b475046ff17c6681, support for eglibc
was removed, but forgot to remove the corresponding hashes from the hash
file. This commit fixes this mistake.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibc/glibc.hash | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index b04f214..052f281 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,8 +1,3 @@
 # Locally calculated after checking pgp signature (glibc)
-# http://downloads.yoctoproject.org/releases/eglibc/*.{md5,sha1} (eglibc)
-md5	b395b021422a027d89884992e91734fc	eglibc-2.18-svnr23787.tar.bz2
-sha1	224d9e655e8f0ad04ffde47b97a11c64e2255b56	eglibc-2.18-svnr23787.tar.bz2
-md5	197836c2ba42fb146e971222647198dd	eglibc-2.19-svnr25243.tar.bz2
-sha1	8013c1935b46fd50d2d1fbfad3b0af362b75fb28	eglibc-2.19-svnr25243.tar.bz2
 sha256	eb731406903befef1d8f878a46be75ef862b9056ab0cde1626d08a7a05328948	glibc-2.22.tar.xz
 sha256	94efeb00e4603c8546209cefb3e1a50a5315c86fa9b078b6fad758e187ce13e9	glibc-2.23.tar.xz
