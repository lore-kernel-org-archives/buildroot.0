From: Tim Judd <tjudd2k@yahoo.com>
Date: Mon, 28 Nov 2011 20:09:47 -0800 (PST)
Subject: [Buildroot] kernel-headers toolchain
Message-ID: <1322539787.53021.YahooMailNeo@web161203.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I had sent an earlier message to the list with and got no replies.

I see this list is pretty technical and maybe somewhat automated in the sense of patches and git / code revision messages.? I'll make my message brief



I'm rebuilding the userland part of a firmware image, and need to keep the OEM kernel intact.? OEM kernel is 2.6.19 and my dead simple question is which environment do the toolchain/kernel-headers get compiled against?? host OS or against the uclibc?? I ask because I keep getting various redefinition errors (among others) and I can't make heads or tails if I need to downgrade uclibc, host stdlibc, or gcc.

example:
(linux-2.6.19 defines getline())

/usr/lib/stdio.h getline() redefined

I would like to know:
1.? which build environment do I need to downgrade/find archived copies of
2.? -OR- is it safe to use toolchain/kernel-headers with a more recent kernel (2.6.3x) against a running 2.6.19 kernel?



thanks!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111128/69ce21c4/attachment-0001.html>
