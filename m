From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 May 2012 16:56:09 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.05/fix-libfcgi
Message-ID: <cover.1336316166.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit ed7b3362ad6dc33899766c803bba51240111aa43:

  valgrind: fix build on PowerPC/uClibc (2012-05-06 11:49:19 +0200)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git for-2012.05/fix-libfcgi

for you to fetch changes up to 15397c627335fa50a090bd518b07bbf0b37ab47b:

  libfcgi: fix build problem of libfcgi++ (2012-05-06 16:54:35 +0200)

----------------------------------------------------------------
Thomas Petazzoni (1):
      libfcgi: fix build problem of libfcgi++

 .../libfcgi/libfcgi-link-against-libfcgi-la.patch  |   20 ++++++
 package/libfcgi/libfcgi-link-against-math.patch    |   28 ++++++++
 package/libfcgi/libfcgi-make-autoreconfable.patch  |   67 ++++++++++++++++++++
 package/libfcgi/libfcgi.mk                         |    2 +-
 4 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 package/libfcgi/libfcgi-link-against-libfcgi-la.patch
 create mode 100644 package/libfcgi/libfcgi-link-against-math.patch
 create mode 100644 package/libfcgi/libfcgi-make-autoreconfable.patch

Thanks,
-- 
Thomas Petazzoni
