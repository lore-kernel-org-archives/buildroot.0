From: Diego Iastrubni <diegoiast@gmail.com>
Date: Mon, 10 Oct 2011 11:32:34 +0200
Subject: [Buildroot] [RFC] Build time graph generation
In-Reply-To: <cover.1318176666.git.thomas.petazzoni@free-electrons.com>
References: <cover.1318176666.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CALR4fE+BG6iN3h1=kpSg2pR-hH63q8stm74uoAOdkUYHkw_igw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 9, 2011 at 6:17 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Here are two patches that implement a simple modification of the
> package infrastructure to output some timing data about the duration
> taken by each step for each package, and then a small Python script
> that generates graphs from those informations.
>
> I am not sure that there is any useful usage of those graphs, but it's
> fun and there are nice to look at.
>
> Here are some sample graphs, first on a moderately large package set:
>
>
> http://free-electrons.com/~thomas/pub/buildroot/graph-time/big/histogram-build-order.pdf
>
> http://free-electrons.com/~thomas/pub/buildroot/graph-time/big/histogram-duration-order.pdf
>
> http://free-electrons.com/~thomas/pub/buildroot/graph-time/big/pie-packages.pdf
>
> http://free-electrons.com/~thomas/pub/buildroot/graph-time/big/pie-steps.pdf
>
> and then on a smaller package set:
>
>
> http://free-electrons.com/~thomas/pub/buildroot/graph-time/small/histogram-build-order.pdf
>
> http://free-electrons.com/~thomas/pub/buildroot/graph-time/small/histogram-duration-order.pdf
>
> http://free-electrons.com/~thomas/pub/buildroot/graph-time/small/pie-packages.pdf
>
> http://free-electrons.com/~thomas/pub/buildroot/graph-time/small/pie-steps.pdf
>
> I don't think the modification to the package infrastructure is ready
> for merging (there are many cases not handled, like when the timing
> data should be cleaned up, the case of overriden packages not being
> handled, etc.) and I am not even sure it is useful to complicate the
> package infrastructure with such a not-so-useful feature.
>

Nice, that would be a great feature to add. Even better if you can save the
whole charts in the same doc :)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111010/c4ef8786/attachment.html>
