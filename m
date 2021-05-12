From: Joachim Wiberg <troglobit@gmail.com>
Date: Wed, 12 May 2021 06:24:53 +0200
Subject: [Buildroot] [PATCH 0/1] package/sysklogd: bump to version 2.2.3
Message-ID: <20210512042454.1099381-1-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a stable patch release with fixes related to interop with
different libc's, 64-bit time calculation on 32-bit systems, and
similar.  I recommend this go into the 2021.02.x stable tree.

Best regards
 /Joachim

Joachim Wiberg (1):
  package/sysklogd: bump to version 2.2.3

 package/sysklogd/sysklogd.hash | 5 ++++-
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.25.1
