From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Sat, 22 Dec 2012 15:41:20 +0200
Subject: [Buildroot] Patch file too big
Message-ID: <50D5B880.6000008@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello to all.

I found out that my [PATCH 04/12] elfutils is too big to submit here.
It's size is about 1.5 MB (only grub.400-nic_update2.patch in buildroot
is bigger, with size of 1.6 MB)

The patch contains gnulib functionality to allow elfutils to compile and
it can't be easily splitted.

Is there any free, public service that I could use to upload it and just
submit link to it here ?
I already tried pastebin free version and it was too big for there too.

Regards
Stefan
