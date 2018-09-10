From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 11 Sep 2018 00:27:42 +0200
Subject: [Buildroot] [PATCH 0/2] python-numpy: update package licensing
Message-ID: <20180910222744.82143-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Correct actual hash LICENSE.txt base license file
Update license list according to bundle libraries licenses

Giulio Benetti (2):
  python-numpy: correct LICENSE.txt hash value
  python-numpy: fix make legal-info failure

 ...02-Add-sublibraries-missing-licenses.patch | 89 +++++++++++++++++++
 package/python-numpy/python-numpy.hash        |  6 +-
 package/python-numpy/python-numpy.mk          |  7 +-
 3 files changed, 99 insertions(+), 3 deletions(-)
 create mode 100644 package/python-numpy/0002-Add-sublibraries-missing-licenses.patch

-- 
2.17.1
