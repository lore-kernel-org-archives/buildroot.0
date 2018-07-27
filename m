From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Fri, 27 Jul 2018 21:54:18 +0200
Subject: [Buildroot] [PATCH 0/5] add missing licenses to recently added perl
 packages
Message-ID: <20180727195423.21338-1-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As requested by Thomas Petazzoni, this series adds the missing license
declarations for perl packages recently added by me.

/Thomas


Thomas De Schampheleire (5):
  perl-crypt-blowfish: add missing license declaration
  perl-crypt-cbc: add missing license declaration
  perl-mime-base64-urlsafe: add missing license declaration
  perl-net-ping: add missing license declaration
  perl-net-telnet: add missing license declaration

 package/perl-crypt-blowfish/perl-crypt-blowfish.mk           | 1 +
 package/perl-crypt-cbc/perl-crypt-cbc.hash                   | 4 ++--
 package/perl-crypt-cbc/perl-crypt-cbc.mk                     | 3 ++-
 package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk | 1 +
 package/perl-net-ping/perl-net-ping.mk                       | 1 +
 package/perl-net-telnet/perl-net-telnet.mk                   | 1 +
 6 files changed, 8 insertions(+), 3 deletions(-)

-- 
2.16.4
