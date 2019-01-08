From: David Picard <dplamp@gmx.com>
Date: Tue, 8 Jan 2019 10:43:05 +0100
Subject: [Buildroot] linux-firmware package : files not copied to TARGET_DIR
Message-ID: <c5319275-53e0-f7df-3fdb-a9699160bd1f@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The linux-firmware package builds OK. But I have to manually copy the 
binary blob required by the driver to $TARGET/lib/firmware.

I'm wondering if it's normal behavior.

- David
