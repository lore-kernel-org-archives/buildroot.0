From: Jordan Yelloz <jordan@yelloz.me>
Date: Sun, 12 Jun 2016 19:38:26 -0700
Subject: [Buildroot] [PATCH 1/1] fwup: blanked out MANS to avoid running
	help2man
Message-ID: <20160613023826.6329-1-jordan@yelloz.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


If you have help2man installed, the build system will try to run
help2man on the target fwup binary which should not be expected to work.

Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
---
 package/fwup/fwup.mk | 2 ++
 1 file changed, 2 insertions(+)

-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-fwup-blanked-out-MANS-to-avoid-running-help2man.patch
Type: text/x-patch
Size: 395 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160612/26a6b41a/attachment.bin>
