From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 21:13:47 +0200
Subject: [Buildroot] [PATCH 0/7] Add a gitlab macro
Message-ID: <20210328191355.778786-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a small patch series that adds a gitlab macro, similar to the
github macro. What prompted me to add this is a pending patch for a
package, which uses gitlab, but does a git clone instead of relying on
gitlab tarballs.

Hopefully, having a gitlab macro will make it more obvious how we
prefer to handle things.

This series also has a preparation patch improving some details about
the github macro.

Thanks,

Thomas

Thomas Petazzoni (7):
  docs/manual: improve details about the Github macro
  package/pkg-download.mk: add gitlab macro
  docs/manual: add documentation for the gitlab macro
  package/eigen: use gitlab macro
  package/frotz: use gitlab macro
  package/ipcalc: use gitlab macro
  package/libsoundtouch: use gitlab macro

 docs/manual/adding-packages-tips.txt   | 40 ++++++++++++++++++++++++--
 package/eigen/eigen.mk                 |  2 +-
 package/frotz/frotz.mk                 |  2 +-
 package/ipcalc/ipcalc.mk               |  2 +-
 package/libsoundtouch/libsoundtouch.mk |  2 +-
 package/pkg-download.mk                |  3 ++
 6 files changed, 45 insertions(+), 6 deletions(-)

-- 
2.30.2
