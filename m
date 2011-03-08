From: Alexander Yohananov <yohananov@gmail.com>
Date: Tue, 8 Mar 2011 16:33:20 +0200
Subject: [Buildroot] lockfile-progs depends on liblockfile (small fix)
Message-ID: <AANLkTinY+yzNky7Fi=kyQsLcz3ksCy84ZFGGDjxw1YKC@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry for sending it the second time, there was an error in the previous
post.
The file that lacks dependency definition is
lockfile-progs.mk<http://liblockfile.mk/>,
not liblockfile.mk as it was reported the first time.

Best regards, Alexander.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110308/d706378c/attachment.html>
