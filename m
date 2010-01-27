From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 27 Jan 2010 11:55:08 +0000
Subject: [Buildroot] PATCH: Ensures kernel fully patched for board before
	running config
Message-ID: <4B60299C.2020004@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch ensure that if you run make linux26-menuconfig and linux has 
not yet been built, it will correctly apply all of the board patches 
before running menuconfig
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: 0001-Fixed-linux26-menuconfig-not-applying-board-patches.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100127/85159550/attachment.diff>
