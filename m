From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  2 Mar 2014 19:21:40 +0100
Subject: [Buildroot] [PATCH 0/4] Brand new website
Message-ID: <1393784504-11327-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series updates our current website.
It also take the occasion to move the README file that was in the docs
subdirectory to the root of the project.
First by getting Bootstrap and JQuery into it, then reworking the HTML and the
content a bit.

Maxime Hadjinlian (4):
  docs: Move README file to root
  website: Add Bootstrap and JQuery framework
  website: Add Buildroot javascript
  website: new website !

 docs/README => README                      |    0
 docs/about.html                            |   11 +-
 docs/contribute.html                       |   39 +
 docs/css/bootstrap-responsive.css          | 1092 +++++
 docs/css/bootstrap-responsive.min.css      |    9 +
 docs/css/bootstrap.css                     | 6039 ++++++++++++++++++++++++++++
 docs/css/bootstrap.min.css                 |  882 ++++
 docs/css/bootswatch.less                   |  181 +
 docs/css/variables.less                    |  301 ++
 docs/developer.html                        |   47 -
 docs/docs.html                             |    4 +-
 docs/download.html                         |   46 +-
 docs/footer.html                           |   24 +-
 docs/header.html                           |  104 +-
 docs/images/glyphicons-halflings-white.png |  Bin 0 -> 8777 bytes
 docs/images/glyphicons-halflings.png       |  Bin 0 -> 12799 bytes
 docs/images/logo.png                       |  Bin 129459 -> 117499 bytes
 docs/images/menuconfig.png                 |  Bin 9087 -> 8604 bytes
 docs/index.html                            |   34 +-
 docs/js/bootstrap.js                       | 2159 ++++++++++
 docs/js/bootstrap.min.js                   |    6 +
 docs/js/buildroot.js                       |   64 +
 docs/js/jquery-1.10.2.min.js               |    6 +
 docs/lists.html                            |   40 -
 docs/news.html                             |  113 +-
 docs/sponsors.html                         |    2 +-
 docs/stylesheet.css                        |   75 -
 docs/support.html                          |   45 +
 28 files changed, 11007 insertions(+), 316 deletions(-)
 rename docs/README => README (100%)
 create mode 100644 docs/contribute.html
 create mode 100644 docs/css/bootstrap-responsive.css
 create mode 100644 docs/css/bootstrap-responsive.min.css
 create mode 100644 docs/css/bootstrap.css
 create mode 100644 docs/css/bootstrap.min.css
 create mode 100644 docs/css/bootswatch.less
 create mode 100644 docs/css/variables.less
 delete mode 100644 docs/developer.html
 create mode 100644 docs/images/glyphicons-halflings-white.png
 create mode 100644 docs/images/glyphicons-halflings.png
 create mode 100644 docs/js/bootstrap.js
 create mode 100644 docs/js/bootstrap.min.js
 create mode 100644 docs/js/buildroot.js
 create mode 100644 docs/js/jquery-1.10.2.min.js
 delete mode 100644 docs/lists.html
 delete mode 100644 docs/stylesheet.css
 create mode 100644 docs/support.html

--
1.8.5.3
