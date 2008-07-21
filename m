From: Wade Berrier <wberrier@gmail.com>
Date: Mon, 21 Jul 2008 15:46:06 -0600
Subject: [Buildroot] vim patches .patch
Message-ID: <bbbeeccd0807211446q5f7800ddlf2463305b7635056@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Attached is a patch to add some more patches to vim.  More
importantly, it downloads them via http instead of ftp.  Downloading
via ftp takes forever.

I only went up to 274 (instead of 330) because patches started failing
to apply after that.

Wade
-------------- next part --------------
A non-text attachment was scrubbed...
Name: vim_buildroot.patch
Type: text/x-diff
Size: 840 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080721/787bc107/attachment.patch 
