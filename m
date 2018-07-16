From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 15 Jul 2018 21:44:33 -0300
Subject: [Buildroot] [PATCH 2/5] support/docker: rename the Dockerfile
 and its accompanying file
References: <adea9d795751dd2ddcc2b205a7eb90da24990d7c.1531463897.git.yann.morin.1998@free.fr>
Message-ID: <5b4bea714dff9_7adf3f993c6b5368439b2@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Jul 13, 2018 at 03:38 AM, Yann E. MORIN wrote:

[snip]
> We add a symlink so that we still have a 'base' image that we can
> reference from the gitla-ci infra.

We could drop the symlink and just use the new name in .gitlab-ci.yml* once the
new image gets uploaded:
-image: buildroot/base:20180318.1724
+image: buildroot/debian-stretch:2018MMDD.HHMM


Also, see my review on patch 1, I think it would be better to invert the order
of patches 1 and 2 in the series.


Regards,
Ricardo
