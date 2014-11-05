From: Michael Sumulong <msumulong@gmail.com>
Date: Wed, 5 Nov 2014 11:05:16 -0500
Subject: [Buildroot] e2progs and pkgconfig file
Message-ID: <CABDNR17g3JtFyPYmdioVzBg+OLDC9OQYk06BKPq2FiwDhEcuCw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am currently trying to get partclone to compile under buildroot which
uses the ext2fs libraries. However, I get an issue when partclone compiles
and its looking for a ext2fs.pc file under usr/lib/pkgconfig. Compiling
e2fsprogs for the target does not produce this file under
output/target/usr/lib/pkgconfig but if I compile the host-e2fsprogs it does
generate a ext2fs.pc file under output/host/usr/lib/pkgconfig. I'm not sure
if this is a bug or done on purpose for some reason.

-Mike
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141105/a1e7a0c7/attachment.html>
