From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 04 Jan 2014 09:58:42 +0100
Subject: [Buildroot] [PATCH 1/1] transmission: Fix line feeds in patch
	file
References: <BLU0-SMTP20778F191E3944FD27E1226D9B50@phx.gbl>
Message-ID: <23vkpax6cg.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <berndkuhls@hotmail.com> wrote in
news:BLU0-SMTP20778F191E3944FD27E1226D9B50 at phx.gbl: 

> Upstream code has DOS line endings...

Hi,

as I am not sure whether sending a patch with DOS line
endings will work with git-send-email I am attaching
the patch file to this post.

In other words: following line numbers of the patch file
have to have a DOS line ending: 13-18, 29-30.

Regards, Bernd
-------------- next part --------------
A non-text attachment was scrubbed...
Name: transmission-01-fix-utypes.patch
Type: application/octet-stream
Size: 816 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140104/b633291c/attachment.obj>
