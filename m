From: Mark Jackson <mpfj-list@newflow.co.uk>
Date: Tue, 23 Apr 2013 16:20:13 +0100
Subject: [Buildroot] [PATCH v2] fs/ubifs: allow extra options to be passed
 to ubifs creation tools
Message-ID: <5176A6AD.8090907@newflow.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow extra options to be passed to ubifs creation tools.

Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes in v2:
- Minor changes as suggested by Thomas Petazzoni

 fs/ubifs/Config.in |   12 ++++++++++++
 fs/ubifs/ubi.mk    |    2 ++
 fs/ubifs/ubifs.mk  |    4 +++-
 3 files changed, 17 insertions(+), 1 deletion(-)


-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-fs-ubifs-allow-extra-options-to-be-passed-to-ubifs-c.patch
Type: text/x-patch
Size: 1778 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130423/96307107/attachment-0001.bin>
