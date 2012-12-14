From: Woody Wu <narkewoody@gmail.com>
Date: Fri, 14 Dec 2012 04:45:53 +0000 (UTC)
Subject: [Buildroot] Pass CFLAGS when building kernel
Message-ID: <slrnkclbm0.b88.narkewoody@zuhnb712.local.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, list

I want to enalbe pr_debug in kernel building, that means I have to to
define CFLAGS as something like CFLAGS += DEBUG when building kernel.

How should I do this with buildroot? Thanks

-- 
woody
I can't go back to yesterday - because I was a different person then.
