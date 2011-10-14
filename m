From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 14 Oct 2011 11:25:25 +0200
Subject: [Buildroot] [PATCH v5 0/3] Add utilities to set background image in
	Fluxbox
Message-ID: <1318584328-6080-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Changes:
v5: both imlib2 and feh depend on XORG7 and select relevant X-libraries
v3: change package dependencies, so that both ImLib2 and feh depend on BR2_PACKAGE_XORG
v2: add libXext dependency to ImLib2
