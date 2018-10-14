From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 14 Oct 2018 18:35:01 +0200
Subject: [Buildroot] [PATCH 0/3] Perl: Patching Makefile in subdirectories
Message-ID: <20181014163504.28519-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now, patching Makefile is done in a transparent way for the user.


Francois Perrad (3):
  scancpan: compute a variable <pkg>_PATCH_XS_MAKEFILES
  pkg-perl: patch files in <pkg>_PATCH_XS_MAKEFILES
  perl-netaddr-ip: fix build of the XS version

 package/perl-netaddr-ip/perl-netaddr-ip.mk |  6 ++++--
 package/pkg-perl.mk                        | 23 ++++++++++++++++++++++
 utils/scancpan                             | 15 ++++++++++++++
 3 files changed, 42 insertions(+), 2 deletions(-)

-- 
2.17.1
