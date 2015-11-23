From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Nov 2015 22:56:59 +0100
Subject: [Buildroot] [git commit] docs/website: New website
Message-ID: <20151123221453.E469E818CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97ab48658d574ded87f8af799795ba7ed76f6ba4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch introduces a new buildroot website based on a modern flat
layout inspired by material design.

Each page of the old website is converted to the new css/layout, the
big bump is in main page which is completely rewritten. Content of
the old website is copied more or less verbatim, planning to add more
content in the future.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/about.html                            |   62 -
 docs/website/contribute.html                       |   67 +-
 docs/website/css/bootstrap.min.css                 |    7 -
 docs/website/css/bootswatch.less                   |  127 -
 docs/website/css/buildroot.css                     |   46 -
 docs/website/css/main.css                          |  260 ++
 docs/website/css/timeline.css                      |  184 +
 docs/website/css/variables.less                    |  856 ----
 docs/website/docs.html                             |  178 +-
 docs/website/download.html                         |  262 +-
 .../fonts/glyphicons-halflings-regular.woff        |  Bin 23320 -> 23292 bytes
 docs/website/footer.html                           |   12 +-
 docs/website/git.html                              |   48 -
 docs/website/header.html                           |   93 +-
 docs/website/images/browser.png                    |  Bin 0 -> 18175 bytes
 docs/website/images/bug-buddy.png                  |  Bin 0 -> 5946 bytes
 docs/website/images/buildroot-slides.png           |  Bin 0 -> 32837 bytes
 docs/website/images/clippy.svg                     |    3 +
 docs/website/images/email.png                      |  Bin 0 -> 4101 bytes
 docs/website/images/gift.png                       |  Bin 0 -> 15906 bytes
 docs/website/images/github_hash_mongrel2.png       |  Bin 19029 -> 0 bytes
 docs/website/images/glyphicons-halflings-white.png |  Bin 8777 -> 0 bytes
 docs/website/images/glyphicons-halflings.png       |  Bin 12799 -> 0 bytes
 docs/website/images/gplus.png                      |  Bin 4760 -> 0 bytes
 docs/website/images/hammer.png                     |  Bin 0 -> 18353 bytes
 docs/website/images/irc.png                        |  Bin 0 -> 7696 bytes
 docs/website/images/menuconfig.png                 |  Bin 8604 -> 181491 bytes
 docs/website/images/menuconfig_small.png           |  Bin 8604 -> 0 bytes
 docs/website/images/nconfig.png                    |  Bin 0 -> 88055 bytes
 docs/website/images/package.png                    |  Bin 0 -> 7746 bytes
 docs/website/images/pdf-icon.png                   |  Bin 0 -> 10324 bytes
 docs/website/images/text.png                       |  Bin 0 -> 6437 bytes
 docs/website/images/tux-flat.png                   |  Bin 0 -> 20106 bytes
 docs/website/images/valid-html401.png              |  Bin 1950 -> 0 bytes
 docs/website/images/xconfig.png                    |  Bin 0 -> 224081 bytes
 docs/website/images/zip.png                        |  Bin 0 -> 8208 bytes
 docs/website/index.html                            |  174 +-
 docs/website/js/bootstrap.min.js                   |    6 -
 docs/website/js/buildroot.js                       |   48 +
 docs/website/js/jquery-1.11.1.min.js               |    4 -
 docs/website/news.html                             | 4264 +++++++++++++-------
 docs/website/sponsors.html                         |  358 +-
 docs/website/support.html                          |  117 +-
 43 files changed, 4012 insertions(+), 3164 deletions(-)

Patch is too large, so refusing to show it
