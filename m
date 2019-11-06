From: Jens Kleintje <scooby22@web.de>
Date: Wed,  6 Nov 2019 16:56:09 +0100
Subject: [Buildroot] [PATCH 0/2] package/gcnano-binaries: new package
Message-ID: <20191106155611.31575-1-scooby22@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package is tested with the following steps:
modprobe galcore
export QT_QPA_EGLFS_ALWAYS_SET_MODE=1

With QT_QPA_EGLFS_ALWAYS_SET_MODE=1 qt performs a video mode set
on every application startup.
