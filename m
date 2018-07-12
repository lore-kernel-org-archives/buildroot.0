From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Thu, 12 Jul 2018 23:00:44 +0200
Subject: [Buildroot] [PATCH 00/10] new perl packages
Message-ID: <20180712210054.13775-1-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Basic addition of some new perl packages...


Thomas De Schampheleire (10):
  perl-convert-asn1: new package
  perl-crypt-blowfish: new package
  perl-crypt-cbc: new package
  perl-digest-md5: new package
  perl-mime-base64-urlsafe: new package
  perl-mojolicious-plugin-authentication: new package
  perl-net-ping: new package
  perl-net-snmp: new package
  perl-net-ssh2: new package
  perl-net-telnet: new package

 DEVELOPERS                                                 | 10 ++++++++++
 package/Config.in                                          | 10 ++++++++++
 package/perl-convert-asn1/Config.in                        |  6 ++++++
 package/perl-convert-asn1/perl-convert-asn1.hash           |  6 ++++++
 package/perl-convert-asn1/perl-convert-asn1.mk             | 13 +++++++++++++
 package/perl-crypt-blowfish/Config.in                      | 10 ++++++++++
 package/perl-crypt-blowfish/perl-crypt-blowfish.hash       |  6 ++++++
 package/perl-crypt-blowfish/perl-crypt-blowfish.mk         | 12 ++++++++++++
 package/perl-crypt-cbc/Config.in                           |  6 ++++++
 package/perl-crypt-cbc/perl-crypt-cbc.hash                 |  6 ++++++
 package/perl-crypt-cbc/perl-crypt-cbc.mk                   | 12 ++++++++++++
 package/perl-digest-md5/Config.in                          | 10 ++++++++++
 package/perl-digest-md5/perl-digest-md5.hash               |  6 ++++++
 package/perl-digest-md5/perl-digest-md5.mk                 | 13 +++++++++++++
 package/perl-mime-base64-urlsafe/Config.in                 |  6 ++++++
 .../perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.hash |  6 ++++++
 .../perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk   | 12 ++++++++++++
 package/perl-mojolicious-plugin-authentication/Config.in   |  7 +++++++
 .../perl-mojolicious-plugin-authentication.hash            |  6 ++++++
 .../perl-mojolicious-plugin-authentication.mk              | 14 ++++++++++++++
 package/perl-net-ping/Config.in                            |  6 ++++++
 package/perl-net-ping/perl-net-ping.hash                   |  6 ++++++
 package/perl-net-ping/perl-net-ping.mk                     | 12 ++++++++++++
 package/perl-net-snmp/Config.in                            |  6 ++++++
 package/perl-net-snmp/perl-net-snmp.hash                   |  6 ++++++
 package/perl-net-snmp/perl-net-snmp.mk                     | 14 ++++++++++++++
 package/perl-net-ssh2/Config.in                            | 11 +++++++++++
 package/perl-net-ssh2/perl-net-ssh2.hash                   |  6 ++++++
 package/perl-net-ssh2/perl-net-ssh2.mk                     | 14 ++++++++++++++
 package/perl-net-telnet/Config.in                          |  6 ++++++
 package/perl-net-telnet/perl-net-telnet.hash               |  6 ++++++
 package/perl-net-telnet/perl-net-telnet.mk                 | 12 ++++++++++++
 32 files changed, 282 insertions(+)
 create mode 100644 package/perl-convert-asn1/Config.in
 create mode 100644 package/perl-convert-asn1/perl-convert-asn1.hash
 create mode 100644 package/perl-convert-asn1/perl-convert-asn1.mk
 create mode 100644 package/perl-crypt-blowfish/Config.in
 create mode 100644 package/perl-crypt-blowfish/perl-crypt-blowfish.hash
 create mode 100644 package/perl-crypt-blowfish/perl-crypt-blowfish.mk
 create mode 100644 package/perl-crypt-cbc/Config.in
 create mode 100644 package/perl-crypt-cbc/perl-crypt-cbc.hash
 create mode 100644 package/perl-crypt-cbc/perl-crypt-cbc.mk
 create mode 100644 package/perl-digest-md5/Config.in
 create mode 100644 package/perl-digest-md5/perl-digest-md5.hash
 create mode 100644 package/perl-digest-md5/perl-digest-md5.mk
 create mode 100644 package/perl-mime-base64-urlsafe/Config.in
 create mode 100644 package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.hash
 create mode 100644 package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk
 create mode 100644 package/perl-mojolicious-plugin-authentication/Config.in
 create mode 100644 package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash
 create mode 100644 package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
 create mode 100644 package/perl-net-ping/Config.in
 create mode 100644 package/perl-net-ping/perl-net-ping.hash
 create mode 100644 package/perl-net-ping/perl-net-ping.mk
 create mode 100644 package/perl-net-snmp/Config.in
 create mode 100644 package/perl-net-snmp/perl-net-snmp.hash
 create mode 100644 package/perl-net-snmp/perl-net-snmp.mk
 create mode 100644 package/perl-net-ssh2/Config.in
 create mode 100644 package/perl-net-ssh2/perl-net-ssh2.hash
 create mode 100644 package/perl-net-ssh2/perl-net-ssh2.mk
 create mode 100644 package/perl-net-telnet/Config.in
 create mode 100644 package/perl-net-telnet/perl-net-telnet.hash
 create mode 100644 package/perl-net-telnet/perl-net-telnet.mk

-- 
2.16.4
