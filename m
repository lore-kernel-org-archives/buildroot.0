From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 May 2011 17:47:48 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.05/psmisc-fix
Message-ID: <cover.1305992862.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit a02cfbf1f4a82ee6582e2bf7622b2bf105359ea9:

  bind: give path to OpenSSL when OpenSSL is enabled (2011-05-19 20:03:35 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.05/psmisc-fix

Thomas Petazzoni (2):
      psmisc: fix build by linking against libintl when needed
      psmisc: do not install pstree.x11 symbolic link

 package/psmisc/psmisc-link-against-libintl.patch |   43 ++++++++++++++++++++++
 package/psmisc/psmisc-no-__progname.patch        |   23 ++++++++++--
 2 files changed, 63 insertions(+), 3 deletions(-)
 create mode 100644 package/psmisc/psmisc-link-against-libintl.patch

Thanks,
-- 
Thomas Petazzoni
