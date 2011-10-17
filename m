From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 17 Oct 2011 10:41:04 +0200
Subject: [Buildroot] [PATCH v6 0/3] Add utilities to set background image in
	Fluxbox
Message-ID: <1318840867-20976-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Changes:
v6: imlib2: always select freetype, feh: always select ImLib2 JPEG support
v5: both imlib2 and feh depend on XORG7 and select relevant X-libraries
v3: change package dependencies, so that both ImLib2 and feh depend on BR2_PACKAGE_XORG
v2: add libXext dependency to ImLib2
