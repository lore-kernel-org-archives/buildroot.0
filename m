From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri,  4 Dec 2015 08:21:10 +0100
Subject: [Buildroot] [PATCH 0/4] website caring
Message-ID: <1449213674-11333-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series:

* Fixes all errors found by html tidy
* Fixes indentation on all html using html tidy rules
* Add tidy_config.txt with tidy configuration used in
  reindentation
* Resizes images to a correct size
* Minor cosmetic changes to docs and download pages

Angelo Compagnucci (4):
  docs/website: fixing html tidy errors and warnings
  docs/website: html cleaning and indentation fixing
  docs/website: resizing images
  docs/website: cosmetic changes

 docs/website/contribute.html     |   74 +-
 docs/website/css/main.css        |   15 +-
 docs/website/docs.html           |  237 +-
 docs/website/download.html       |  354 +--
 docs/website/footer.html         |   12 +-
 docs/website/header.html         |  120 +-
 docs/website/images/browser.png  |  Bin 18175 -> 8927 bytes
 docs/website/images/gift.png     |  Bin 15906 -> 10565 bytes
 docs/website/images/hammer.png   |  Bin 18353 -> 11740 bytes
 docs/website/images/logo.png     |  Bin 117499 -> 83758 bytes
 docs/website/images/package.png  |  Bin 7746 -> 5449 bytes
 docs/website/images/pdf-icon.png |  Bin 10324 -> 5798 bytes
 docs/website/images/text.png     |  Bin 6437 -> 3824 bytes
 docs/website/images/tux-flat.png |  Bin 20106 -> 14812 bytes
 docs/website/images/zip.png      |  Bin 8208 -> 5164 bytes
 docs/website/index.html          |  241 +-
 docs/website/news.html           | 6343 +++++++++++++++++++++-----------------
 docs/website/sponsors.html       |  459 +--
 docs/website/support.html        |  187 +-
 docs/website/tidy_config.txt     |    5 +
 20 files changed, 4495 insertions(+), 3552 deletions(-)
 create mode 100644 docs/website/tidy_config.txt

-- 
1.9.1
