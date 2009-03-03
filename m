From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Tue,  3 Mar 2009 11:58:22 +0100
Subject: [Buildroot] some patches and new packages
In-Reply-To: <>
References: <>
Message-ID: <1236077910-15674-1-git-send-email-razzor@kopf-tisch.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here are some patches and new packages that I use.

BR2_PACKAGE_NTFS-3G was renamed to BR2_PACKAGE_NTFS_3G, since
autotargets doesn't like the '-'.

All patches are based on r25499 and tested on x86.

Regards
Olaf
