From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 30 Mar 2008 13:40:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: webif webif/files
	webif/files/etc webif etc...
Message-ID: <20080330204053.E286B3C520@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-30 13:40:53 -0700 (Sun, 30 Mar 2008)
New Revision: 21584

Log:
Add webif package

Added:
   trunk/buildroot/package/webif/
   trunk/buildroot/package/webif/Config.in
   trunk/buildroot/package/webif/files/
   trunk/buildroot/package/webif/files/etc/
   trunk/buildroot/package/webif/files/etc/httpd.conf
   trunk/buildroot/package/webif/files/usr/
   trunk/buildroot/package/webif/files/usr/lib/
   trunk/buildroot/package/webif/files/usr/lib/webif/
   trunk/buildroot/package/webif/files/usr/lib/webif/apply.sh
   trunk/buildroot/package/webif/files/usr/lib/webif/categories.awk
   trunk/buildroot/package/webif/files/usr/lib/webif/common.awk
   trunk/buildroot/package/webif/files/usr/lib/webif/form.awk
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/ca/
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/ca/common.txt
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/cz/
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/cz/common.txt
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/de/
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/de/common.txt
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/dk/
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/dk/common.txt
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/ee/
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/ee/common.txt
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/es/
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/es/common.txt
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/fr/
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/fr/common.txt
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/hr/
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/hr/common.txt
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/hu/
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/hu/common.txt
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/it/
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/it/common.txt
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/nl/
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/nl/common.txt
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/no/
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/no/common.txt
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/pl/
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/pl/common.txt
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/pt/
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/pt/common.txt
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/ru/
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/ru/common.txt
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/se/
   trunk/buildroot/package/webif/files/usr/lib/webif/lang/se/common.txt
   trunk/buildroot/package/webif/files/usr/lib/webif/languages.awk
   trunk/buildroot/package/webif/files/usr/lib/webif/subcategories.awk
   trunk/buildroot/package/webif/files/usr/lib/webif/validate.awk
   trunk/buildroot/package/webif/files/usr/lib/webif/webif.sh
   trunk/buildroot/package/webif/files/www/
   trunk/buildroot/package/webif/files/www/cgi-bin/
   trunk/buildroot/package/webif/files/www/cgi-bin/webif.sh
   trunk/buildroot/package/webif/files/www/cgi-bin/webif/
   trunk/buildroot/package/webif/files/www/cgi-bin/webif/.categories
   trunk/buildroot/package/webif/files/www/cgi-bin/webif/about.sh
   trunk/buildroot/package/webif/files/www/cgi-bin/webif/config.sh
   trunk/buildroot/package/webif/files/www/cgi-bin/webif/index.sh
   trunk/buildroot/package/webif/files/www/cgi-bin/webif/info.sh
   trunk/buildroot/package/webif/files/www/cgi-bin/webif/ipkg.sh
   trunk/buildroot/package/webif/files/www/cgi-bin/webif/status-connection.sh
   trunk/buildroot/package/webif/files/www/cgi-bin/webif/status-dhcp.sh
   trunk/buildroot/package/webif/files/www/cgi-bin/webif/status-wireless.sh
   trunk/buildroot/package/webif/files/www/index.html
   trunk/buildroot/package/webif/files/www/webif.css
   trunk/buildroot/package/webif/files/www/webif.js
   trunk/buildroot/package/webif/src/
   trunk/buildroot/package/webif/src/bstrip.c
   trunk/buildroot/package/webif/src/webif-page.c
   trunk/buildroot/package/webif/webif.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:

Sorry, the patch is too large to include (5903 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=21584
