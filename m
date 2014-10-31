From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 31 Oct 2014 16:50:49 +0100
Subject: [Buildroot] [PATCH 0/2] RWD Website
Message-ID: <1414770651-23358-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series implements an RWD website.

The patch is splitted in two:

The first one upgrades to bootstrap 3.2, jquery 1.11.1 and removes older files.
The second one contains the RWD rework.

Angelo Compagnucci (2):
  docs: RWD website - upgrading bootstrap/jquery
  docs: RWD website

 docs/about.html                              |   13 +-
 docs/contribute.html                         |    6 +
 docs/css/bootstrap-responsive.css            | 1092 -----
 docs/css/bootstrap-responsive.min.css        |    9 -
 docs/css/bootstrap.css                       | 6039 --------------------------
 docs/css/bootstrap.min.css                   | 2360 ++++++----
 docs/css/buildroot.css                       |   14 +-
 docs/docs.html                               |    6 +
 docs/download.html                           |    6 +
 docs/fonts/glyphicons-halflings-regular.woff |  Bin 0 -> 23320 bytes
 docs/footer.html                             |    2 +-
 docs/git.html                                |    5 +
 docs/header.html                             |   36 +-
 docs/index.html                              |   55 +-
 docs/js/bootstrap.js                         | 2159 ---------
 docs/js/bootstrap.min.js                     |   10 +-
 docs/js/buildroot.js                         |   11 +-
 docs/js/jquery-1.10.2.min.js                 |    6 -
 docs/js/jquery-1.11.1.min.js                 |    4 +
 docs/news.html                               |    6 +
 docs/sponsors.html                           |  207 +-
 docs/support.html                            |    6 +
 22 files changed, 1709 insertions(+), 10343 deletions(-)
 delete mode 100644 docs/css/bootstrap-responsive.css
 delete mode 100644 docs/css/bootstrap-responsive.min.css
 delete mode 100644 docs/css/bootstrap.css
 create mode 100644 docs/fonts/glyphicons-halflings-regular.woff
 delete mode 100644 docs/js/bootstrap.js
 delete mode 100644 docs/js/jquery-1.10.2.min.js
 create mode 100644 docs/js/jquery-1.11.1.min.js

-- 
2.1.1
