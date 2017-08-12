From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 12 Aug 2017 12:24:50 +0200
Subject: [Buildroot] WIP: glibc 2.16 bump
Message-ID: <a24db610-bef2-c2fc-c9af-ba23cf29cc25@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I started to look at glibc 2.26 bump.
All patches are uptream but the bump trigger some build issue with gcc 7 (older
gcc version are not tested yet).
For now I'm building only the toolchain on several arch, so no runtime test yet.
How the freeelectron farm can help to test new gcc/libc version ?

Best regards,
Romain
