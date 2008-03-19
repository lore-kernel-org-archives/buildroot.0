From: Will Newton <will.newton@gmail.com>
Date: Wed, 19 Mar 2008 16:06:13 +0000
Subject: [Buildroot] [PATCH] Add liboil package
Message-ID: <87a5b0800803190906n5d869976mdfde0675c1f53654@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This patch adds a liboil package to buildroot. liboil is a library of
optimized inner loops used by a number of software packages, typically
things like video and audio codecs.

The top-level Config.in patch may need a little bit of fuzz to apply
against the trunk.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: liboil-package.patch
Type: text/x-diff
Size: 4125 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080319/dc7dde41/attachment.patch 
