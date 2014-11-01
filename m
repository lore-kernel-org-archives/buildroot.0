From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 14:37:40 +0100
Subject: [Buildroot] [git commit] docs: responsive web design website -
	upgrading bootstrap/jquery
Message-ID: <20141101133814.8FC1FB5A5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e40b9791d8c688ec5a1be71817edcc0d42543bad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Upgrading to Bootstrap 3.2.0
* Upgrading to Jquery 1.11.1
* Removing older files

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/css/bootstrap-responsive.css     | 1092 ------
 docs/css/bootstrap-responsive.min.css |    9 -
 docs/css/bootstrap.css                | 6039 ---------------------------------
 docs/css/bootstrap.min.css            |  887 +-----
 docs/js/bootstrap.js                  | 2159 ------------
 docs/js/bootstrap.min.js              |   10 +-
 docs/js/jquery-1.10.2.min.js          |    6 -
 docs/js/jquery-1.11.1.min.js          |    4 +
 8 files changed, 14 insertions(+), 10192 deletions(-)

Patch is too large, so refusing to show it
