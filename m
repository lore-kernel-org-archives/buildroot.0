From: Jordan Yelloz <jordan@yelloz.me>
Date: Sun, 12 Jun 2016 18:56:39 -0700
Subject: [Buildroot] [PATCH 1/1] iptables: exported AR=$(TARGET_AR) to make
Message-ID: <20160613015639.10317-1-jordan@yelloz.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This ensures the correct AR is used for some of the iptables build
process. This is the same fix as
<https://bugs.gentoo.org/show_bug.cgi?id=444282>

Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
---
 package/iptables/iptables.mk | 1 +
 1 file changed, 1 insertion(+)

-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-iptables-exported-AR-TARGET_AR-to-make.patch
Type: text/x-patch
Size: 523 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160612/7ca184ff/attachment.bin>
