From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  5 Jul 2015 16:28:56 +0200
Subject: [Buildroot] [PATCH v9 0/4] OpenCV bump
Message-ID: <1436106540-3466-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Yet another round for the bump of OpenCV package, with this time only
the remaining patches touching the GUI toolkit support.

Patches 1 to 4 update GUI toolkit support.

Regards,

Samuel Martin (4):
  package/opencv: add a choice for selecting the gui toolkit
  package/opencv: add qt5 support
  package/opencv: add gtk3 support
  package/opencv: add opengl support

 package/opencv/Config.in | 101 ++++++++++++++++++++++++++++++++++++-----------
 package/opencv/opencv.mk |  29 ++++++++++++--
 2 files changed, 103 insertions(+), 27 deletions(-)

--
2.4.5
