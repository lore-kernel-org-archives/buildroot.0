From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 22 Sep 2014 21:34:22 +0200
Subject: [Buildroot] [PATCH v2 0/1] ghostscript-fonts: new package
Message-ID: <1411414463-8230-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add ghostscript-fonts still to 'X libraries and helper libraries' where
DejaVu and Liberation fonts are located.

Suggested new locations are ([1]):

a) add new 'Target packages -> Fonts' menu entry
b) add new 'Target packages -> Libraries -> Fonts' menu entry
c) add new 'Target packages -> Graphic libraries/Fonts' submenu entry

Any preferences (or better suggestions...)?

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2014-July/101359.html

Peter Seiderer (1):
  ghostscript-fonts: new package

 package/Config.in                              |  1 +
 package/ghostscript-fonts/Config.in            |  8 ++++++++
 package/ghostscript-fonts/ghostscript-fonts.mk | 21 +++++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/ghostscript-fonts/Config.in
 create mode 100644 package/ghostscript-fonts/ghostscript-fonts.mk

-- 
1.8.1.4
