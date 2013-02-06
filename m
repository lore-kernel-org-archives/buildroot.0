From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  6 Feb 2013 22:49:01 +0100
Subject: [Buildroot] [PATCH v2] Post-image script feature and other related
	fixes
Message-ID: <1360187346-30258-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As discussed during the Buildroot meeting, here is a new version of
the post-image thing and the removal of the customize package.

The number of changes is fairly light:
 * Fixed a few typos in the documentation
 * Added BR2_PACKAGE_CUSTOMIZE in Config.in.legacy
 * Removed the special handling of the customize package from
   pkg-stats.

Best regards,

Thomas
