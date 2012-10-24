From: Randy Graham <surfbytes@gmail.com>
Date: Wed, 24 Oct 2012 15:41:16 -0700
Subject: [Buildroot] Confused about kernel-headers.
Message-ID: <CAG_HyLzE8YJkdyrTCXzNeM6=8YvCfR7xdd6DBRW7rjj091FY0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am using buildroot snapshot 2012.10 to build a linux-3.7-rc1 kernel for
an ARM board and see that the latest kernel-header selectable is 3.5.x (3.7
headers are not listed).

So, my questions are:

1. Why do I need to specify a kernel-headers version when the source
tarball for linux-3.7-rc1 already has it ?

2. How does buildroot use the specified kernel-headers version?

3. How do I go about adding the 3.7 headers if they must be used with my
3.7 kernel ?

I have googled, searched the buildroot source and mailing list but am still
confused.

Thanks for any insights.

-Randy
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121024/2601cd4f/attachment.html>
