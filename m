From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 22:34:31 +0100
Subject: [Buildroot] [git commit] vsftpd: rename patches to the new naming
	convention
Message-ID: <20141201221140.35EF08002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e32501981836bc9b4adeff5434044582e3bfb71
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...px-builddef.patch => 0001-utmpx-builddef.patch} |    0
 ...efile.patch => 0002-dont-force-largefile.patch} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/vsftpd/vsftpd-0001-utmpx-builddef.patch b/package/vsftpd/0001-utmpx-builddef.patch
similarity index 100%
rename from package/vsftpd/vsftpd-0001-utmpx-builddef.patch
rename to package/vsftpd/0001-utmpx-builddef.patch
diff --git a/package/vsftpd/vsftpd-dont-force-largefile.patch b/package/vsftpd/0002-dont-force-largefile.patch
similarity index 100%
rename from package/vsftpd/vsftpd-dont-force-largefile.patch
rename to package/vsftpd/0002-dont-force-largefile.patch
