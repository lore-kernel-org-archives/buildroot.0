From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Nov 2011 00:00:05 +0100
Subject: [Buildroot] [git commit] webif: remove deprecated
Message-ID: <20111108231131.6B2B68F4D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f5e5aeb7125c065c535ecb0774ab48cb7ef4622e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 -
 package/webif/Config.in                            |   28 --
 package/webif/files/etc/httpd.conf                 |    8 -
 package/webif/files/usr/lib/webif/apply.sh         |   76 ----
 package/webif/files/usr/lib/webif/categories.awk   |   27 --
 package/webif/files/usr/lib/webif/common.awk       |   38 --
 package/webif/files/usr/lib/webif/form.awk         |  100 -----
 .../webif/files/usr/lib/webif/lang/ca/common.txt   |  226 ----------
 .../webif/files/usr/lib/webif/lang/cz/common.txt   |  225 ----------
 .../webif/files/usr/lib/webif/lang/de/common.txt   |  228 ----------
 .../webif/files/usr/lib/webif/lang/dk/common.txt   |  231 ----------
 .../webif/files/usr/lib/webif/lang/ee/common.txt   |  230 ----------
 .../webif/files/usr/lib/webif/lang/es/common.txt   |  227 ----------
 .../webif/files/usr/lib/webif/lang/fr/common.txt   |  238 ----------
 .../webif/files/usr/lib/webif/lang/hr/common.txt   |  199 ---------
 .../webif/files/usr/lib/webif/lang/hu/common.txt   |  227 ----------
 .../webif/files/usr/lib/webif/lang/it/common.txt   |  226 ----------
 .../webif/files/usr/lib/webif/lang/nl/common.txt   |  224 ----------
 .../webif/files/usr/lib/webif/lang/no/common.txt   |  230 ----------
 .../webif/files/usr/lib/webif/lang/pl/common.txt   |  228 ----------
 .../webif/files/usr/lib/webif/lang/pt/common.txt   |  454 --------------------
 .../webif/files/usr/lib/webif/lang/ru/common.txt   |  223 ----------
 .../webif/files/usr/lib/webif/lang/se/common.txt   |  223 ----------
 package/webif/files/usr/lib/webif/languages.awk    |   12 -
 .../webif/files/usr/lib/webif/subcategories.awk    |   12 -
 package/webif/files/usr/lib/webif/validate.awk     |  151 -------
 package/webif/files/usr/lib/webif/webif.sh         |  286 ------------
 package/webif/files/www/cgi-bin/webif.sh           |    2 -
 package/webif/files/www/cgi-bin/webif/.categories  |    2 -
 package/webif/files/www/cgi-bin/webif/about.sh     |   31 --
 package/webif/files/www/cgi-bin/webif/config.sh    |   46 --
 package/webif/files/www/cgi-bin/webif/index.sh     |    8 -
 package/webif/files/www/cgi-bin/webif/info.sh      |   44 --
 package/webif/files/www/cgi-bin/webif/ipkg.sh      |    2 -
 .../files/www/cgi-bin/webif/status-connection.sh   |   29 --
 .../webif/files/www/cgi-bin/webif/status-dhcp.sh   |   38 --
 .../files/www/cgi-bin/webif/status-wireless.sh     |   12 -
 package/webif/files/www/index.html                 |   16 -
 package/webif/files/www/webif.css                  |  296 -------------
 package/webif/files/www/webif.js                   |   33 --
 package/webif/src/bstrip.c                         |   75 ----
 package/webif/src/webif-page.c                     |  289 -------------
 package/webif/webif.mk                             |   71 ---
 43 files changed, 0 insertions(+), 5572 deletions(-)

Patch is too large, so refusing to show it
