From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 18:17:09 +0100
Subject: [Buildroot] [git commit] docs: really move the website
Message-ID: <20150125171725.C59C180463@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ee00d0964dddf364c195e656ab938c721b50569
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the automated scripts that deply our website have been updated,
really move the website to its final location.

We still keep a symlink for the images, as they are used both for the
website, and for the manual.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/images                                        |    1 +
 docs/website                                       |    1 -
 docs/{ => website}/about.html                      |    0
 docs/{ => website}/contribute.html                 |    0
 docs/{ => website}/copyright.txt                   |    0
 docs/{ => website}/css/bootstrap.min.css           |    0
 docs/{ => website}/css/bootswatch.less             |    0
 docs/{ => website}/css/buildroot.css               |    0
 docs/{ => website}/css/variables.less              |    0
 docs/{ => website}/docs.html                       |    0
 docs/{ => website}/download.html                   |    0
 docs/{ => website}/favicon.ico                     |  Bin 2238 -> 2238 bytes
 .../fonts/glyphicons-halflings-regular.woff        |  Bin 23320 -> 23320 bytes
 docs/{ => website}/footer.html                     |    0
 docs/{ => website}/git.html                        |    0
 docs/{ => website}/header.html                     |    0
 .../{ => website}/images/boundary-devices-logo.png |  Bin 13305 -> 13305 bytes
 docs/{ => website}/images/calao-logo.png           |  Bin 15386 -> 15386 bytes
 docs/{ => website}/images/circuitco-logo.png       |  Bin 10750 -> 10750 bytes
 docs/{ => website}/images/fluendo-logo.png         |  Bin 9098 -> 9098 bytes
 docs/{ => website}/images/free-electrons-logo.png  |  Bin 9968 -> 9968 bytes
 .../images/glyphicons-halflings-white.png          |  Bin 8777 -> 8777 bytes
 docs/{ => website}/images/glyphicons-halflings.png |  Bin 12799 -> 12799 bytes
 docs/{ => website}/images/google-logo.png          |  Bin 12005 -> 12005 bytes
 docs/{ => website}/images/gplus.png                |  Bin 4760 -> 4760 bytes
 docs/{ => website}/images/imgtec-logo.png          |  Bin 5276 -> 5276 bytes
 docs/{ => website}/images/logo.png                 |  Bin 117499 -> 117499 bytes
 docs/{ => website}/images/logo.xcf                 |  Bin 356067 -> 356067 bytes
 docs/{ => website}/images/logo_small.png           |  Bin 3624 -> 3624 bytes
 docs/{ => website}/images/menuconfig.png           |  Bin 8604 -> 8604 bytes
 docs/{ => website}/images/menuconfig_small.png     |  Bin 8604 -> 8604 bytes
 docs/{ => website}/images/mind-logo.png            |  Bin 10214 -> 10214 bytes
 docs/{ => website}/images/synopsys-logo.png        |  Bin 52426 -> 52426 bytes
 docs/{ => website}/images/valid-html401.png        |  Bin 1950 -> 1950 bytes
 docs/{ => website}/index.html                      |    0
 docs/{ => website}/js/bootstrap.min.js             |    0
 docs/{ => website}/js/buildroot.js                 |    0
 docs/{ => website}/js/jquery-1.11.1.min.js         |    0
 docs/{ => website}/news.html                       |    0
 docs/{ => website}/robots.txt                      |    0
 docs/{ => website}/sponsors.html                   |    0
 docs/{ => website}/support.html                    |    0
 42 files changed, 1 insertions(+), 1 deletions(-)

Patch is too large, so refusing to show it
