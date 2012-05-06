From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 May 2012 17:33:55 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.05/fix-gettext-no-thread
Message-ID: <cover.1336318433.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit ed7b3362ad6dc33899766c803bba51240111aa43:

  valgrind: fix build on PowerPC/uClibc (2012-05-06 11:49:19 +0200)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git for-2012.05/fix-gettext-no-thread

for you to fetch changes up to 045b0f2f0b53edbc30d7f42e157488a5d18f52e8:

  gettext: fix build on !thread toolchains (2012-05-06 17:33:15 +0200)

----------------------------------------------------------------
Thomas Petazzoni (1):
      gettext: fix build on !thread toolchains

 package/gettext/gettext-disable-tests.patch |   37 +++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/gettext/gettext-disable-tests.patch

Thanks,
-- 
Thomas Petazzoni
