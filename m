From: Christian Stewart <christian@paral.in>
Date: Thu, 13 Jun 2019 16:36:38 -0700
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: add disable
 pivot_root option
In-Reply-To: <1560458829-20187-1-git-send-email-frasigal@gmail.com>
References: <1560458829-20187-1-git-send-email-frasigal@gmail.com>
Message-ID: <CA+h8R2pOU_+gL_Su1+b0ibEWBOkVTWKGtg9bRvQKjQ1mivVF+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank,


On Thu, Jun 13, 2019 at 1:47 PM Frank Sigalas <frasigal@gmail.com> wrote:

> Sets the environment variable DOCKER_RAMDISK before starting dockerd.
>
> Signed-off-by: Frank Sigalas <frasigal@gmail.com>
>

I have not had a chance to test this yet, but it looks OK at a first scan.

I wonder if we should select this automatically in the case that the system
is built as a ramdisk and/or linked into the kernel?

Best,
Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190613/9b12e6d7/attachment.html>
