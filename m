From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 12 Jan 2021 10:34:27 +1300
Subject: [Buildroot] [PATCH] package/coremark-pro: fix build without
 threads
In-Reply-To: <20210111222216.09b50e12@windsurf.home>
References: <20210111091353.6978-1-judge.packham@gmail.com>
 <20210111222216.09b50e12@windsurf.home>
Message-ID: <CAFOYHZCdF_t8G9AHW8GS+mWm28w0O_puxmh7km=PAKvBY=jFdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 12, 2021, 10:22 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> On Mon, 11 Jan 2021 22:13:53 +1300
> Chris Packham <judge.packham@gmail.com> wrote:
>
> > Coremark-pro requires threads so add a depends on
> > BR2_TOOLCHAIN_HAS_THREADS.
> >
> > Fixes:
> > -
> http://autobuild.buildroot.net/results/ab574485a7856fcf5cd643c154c44b4bfcb34a97/
> >
> > Signed-off-by: Chris Packham <judge.packham@gmail.com>
> > ---
> >  package/coremark-pro/Config.in | 5 +++++
> >  1 file changed, 5 insertions(+)
>
> I've adjusted the commit title, but this commit doesn't really "fix
> build without threads", it rather adds a dependency on threads :-)
>

Thanks. I did struggle to come up with a sensible commit message so ended
up copying the last commit that did something similar.


> Applied with this minor change. Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210112/ebf8aaa1/attachment.html>
