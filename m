From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 12:16:55 +0200
Subject: [Buildroot] [PATCH v2 00/25] Some new Perl modules
Message-ID: <1429438640-9367-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this patch series adds some modules to buildroot needed by Spamassassin. The
Spamassassin package itself is not yet finished yet, but these modules can be
used by other packages as well so I split them from my tree.

v2:
- added some more dependencies found by scancpan script
- removed all host-perl-package entries (Thomas)

Regards, Bernd

Bernd Kuhls (25):
  package/perl-html-tagset: New package
  package/perl-html-parser: New package
  package/perl-netaddr-ip: New package
  package/perl-net-dns: New package
  package/perl-time-hires: New package
  package/perl-encode-locale: new package
  package/perl-http-date: New package
  package/perl-file-listing: New package
  package/perl-io-html: New package
  package/perl-uri: New package
  package/perl-lwp-mediatypes: New package
  package/perl-http-message: New package
  package/perl-http-cookies: New package
  package/perl-http-daemon: New package
  package/perl-http-negotiate: New package
  package/perl-net-http: New package
  package/perl-www-robotrules: New package
  package/perl-libwww: New package
  package/perl-mime-base64: New package
  package/perl-digest-sha1: new package
  package/perl-timedate: new package
  package/perl-crypt-openssl-random: new package
  package/perl-crypt-openssl-rsa: new package
  package/perl-mailtools: new package
  package/perl-mail-dkim: new package

-- 
1.7.10.4
