From: Ranran <ranshalit@gmail.com>
Date: Fri, 21 Dec 2018 13:16:34 +0200
Subject: [Buildroot] mismatch between kernel version and kernel headers
Message-ID: <CAJ2oMh+1J7oHUyaq9Pbb9PZL9Pd2SN2nX7bzp=UT+25ukEDGRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I use an old kernel 2.6.37 with an embedded machine, yet I need to use
it with more update gcc than the one used on building the image
(Instead of 4.3 need to use 5.1).
I am using latest buildroot for this and use it with linaro toolchain 5.1.
Can it work with kernel 2.6.37 even though the toolchain kernel
headers is 4.0.0 ?

NOTE: I don't use any kernel modules, so not sure if there is any
significance for kernel header mismatch.

What do you think ?

Thank you,
Ran
