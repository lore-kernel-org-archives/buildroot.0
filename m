From: Christian Stewart <christian@paral.in>
Date: Wed, 06 Apr 2016 05:05:47 +0000
Subject: [Buildroot] [PATCH v3 0/3] Add go language support
In-Reply-To: <cover.1459798147.git.geoff@infradead.org>
References: <cover.1459798147.git.geoff@infradead.org>
Message-ID: <CA+h8R2pHQ3YWZXLCM+yoHD6i_KttOJ3wVTuhOo4PLUv0kS=CKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Mon, Apr 4, 2016 at 3:32 PM Geoff Levand <geoff@infradead.org> wrote:

> This series adds support for the go programming language.  I tested the
> build of
> the included flannel package on i386, powerpc64, arm (32 bit) and arm64.
> I did
> runtime testing of the generated flannel binary on arm64.


I haven't had a chance yet to test these on an actual device. However, I've
read through the patches and everything looks good to me. Also, a test
compile resulted in success for my target env.

@Geoff you may add my Acked-by to the commits:

Acked-by: Christian Stewart <christian@paral.in>

In early May we will be returning to work on the Docker-under-Buildroot
related stuff, and I will be rebasing my Docker series on top of this. If
someone else wants to pick that up, please feel free as my work on that is
still a month out.

In the meantime, thanks for the work Geoff, and I look forward to using
your patches in our lab.

Best,
Christian Stewart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160406/f249e968/attachment.html>
