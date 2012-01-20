From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 20 Jan 2012 11:30:12 +0100
Subject: [Buildroot] [PATCH 0/2] introducing udev 177
Message-ID: <1327055414-22482-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series introduces udev 177. A lot of things has been changed since 173:

- udev rules generator was deisabled by default
- udev doesn't create any /dev/ devices any more and relies on devtmpfs
- kmod was introduced to manage kernel modules
- /run directory
- etc.

Changes:
v2: fix dependencies and make verbose commit message (Arnout Vandecappelle)
