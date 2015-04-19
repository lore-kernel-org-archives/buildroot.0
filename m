From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 10:33:13 +0200
Subject: [Buildroot] [PATCH 00/20] Some new Perl modules
Message-ID: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patch series adds some modules to buildroot needed by Spamassassin. The
Spamassassin package itself is not yet finished yet, but these modules can be
used by other packages as well so I split them from my tree.

Regards, Bernd

Bernd Kuhls (20):
  perl-digest-hmac: New package
  perl-html-tagset: New package
  perl-html-parser: New package
  perl-netaddr-ip: New package
  perl-net-dns: New package
  perl-time-hires: New package
  perl-encode-locale: New package
  perl-http-date: New package
  perl-file-listing: New package
  perl-io-html: New package
  perl-uri: New package
  perl-lwp-mediatypes: New package
  perl-http-message: New package
  perl-http-cookies: New package
  perl-http-daemon: New package
  perl-http-negotiate: New package
  perl-net-http: New package
  perl-www-robotrules: New package
  perl-libwww: New package
  perl-mime-base64: New package

-- 
1.7.10.4
