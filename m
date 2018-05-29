From: Liam Staskawicz <liam@stask.net>
Date: Tue, 29 May 2018 10:48:47 -0700
Subject: [Buildroot] custom skeleton question
Message-ID: <85B790C7-22DB-4715-A360-5D229877EB00@stask.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'd like to create a custom rootfs skeleton based on Ubuntu Base (https://wiki.ubuntu.com/Base) via the existing skeleton-custom package, but rather than ship the entire skeleton in my repo, i'd like to download it (either as a step in another custom package or otherwise).

Given that BR2_ROOTFS_SKELETON_CUSTOM_PATH is evaluated at kconfig time, I don't see the best way to supply this value from another package.

Is there a recommended approach to supply this value more dynamically?

Thanks,
Liam
