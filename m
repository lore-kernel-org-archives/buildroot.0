From: Zac Wheeler <zac.wheeler@gmail.com>
Date: Tue, 3 Mar 2009 17:48:15 -0800
Subject: [Buildroot] [PATCH] mDNSresponder bzero-memset
Message-ID: <206b9e70903031748p25a53383sc3464fd017a0884e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a couple of package patches to fix mdnsresponder so
that it uses memset instead of bzero.

This is against the 2009.02 release.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mdnsresponder-remove-bzero.patch
Type: text/x-diff
Size: 10703 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090303/012f6f15/attachment-0001.bin>
