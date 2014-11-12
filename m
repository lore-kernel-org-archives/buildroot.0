From: Jens Stimpfle <debian@jstimpfle.de>
Date: Wed, 12 Nov 2014 01:47:14 +0100
Subject: [Buildroot] Reduce clutter while feature testing
Message-ID: <20141112004714.GC21019@jstimpfle.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

two little patches including notes are attached for
support/dependencies/dependencies.sh

Btw, is there any interest in having the shell scripts cleaned up, even
if this includes more intrusive changes? I'd like to get involved by
playing a little bit with static analysis.

Thanks for your work,
Jens Stimpfle
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Avoid-misleading-error-output-caused-by-missing-shel.patch
Type: text/x-diff
Size: 1700 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141112/5861b531/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-Unclutter-standard-error-output-while-feature-testin.patch
Type: text/x-diff
Size: 2589 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141112/5861b531/attachment-0001.bin>
