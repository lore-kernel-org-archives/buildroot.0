From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 20 Jun 2014 09:37:51 +0200
Subject: [Buildroot] [RFC] FIT image support
In-Reply-To: <CAGm1_ksPaQp8gOWdC4jPhSu87x2GxigywM0QFLWa6WF9Lrbs1w@mail.gmail.com>
References: <CAGm1_ksPaQp8gOWdC4jPhSu87x2GxigywM0QFLWa6WF9Lrbs1w@mail.gmail.com>
Message-ID: <CAGm1_ktuAjUOqumy7Qv_rMj=zhy0m9P9HPRg4Vg38Qt3f5e_9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 19, 2014 at 5:38 PM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> What would be the best approach to support FIT images, i.e. kernel
> image + DTB + initramfs in one file?

FIT slides: http://elinux.org/images/f/f4/Elc2013_Fernandes.pdf

Some caveats: http://lists.denx.de/pipermail/u-boot/2014-May/179909.html

So the simplest workaround would be to copy *.its file to
output/images and then invoke mkimage

Yegor
