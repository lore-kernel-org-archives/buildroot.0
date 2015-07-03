From: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
Date: Sat, 4 Jul 2015 01:52:40 +0200
Subject: [Buildroot] [PATCH v3 0/2] Make Buildroot for Zedboard
 independent on Xilinx tools
In-Reply-To: <20150703174005.GB3652@free.fr>
References: <1434971728-16094-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
 <1435063751-27344-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
 <20150702144038.6485ec47@pcviktorin.fit.vutbr.cz>
 <20150703174005.GB3652@free.fr>
Message-ID: <20150704015240.662c8a78@jvn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

I see your point. I was just uncertain whether it was forgotten
or if there is some issue I did not see. Now, I see you are doing very
well, apologize. Recently, I've beated the contribution process (not
as easy as it looks like when just passively watching the mailing list),
probably I will beat also the review process after some time.

Regards
Jan

On Fri, 3 Jul 2015 19:40:05 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Jan, All,
> 
> On 2015-07-02 14:40 +0200, Jan Viktorin spake thusly:
> > will be the proposed patchs applied in the near future?
> 
> Well, we need to review and test them...
> 
> We currently have 401 patches pending in our patch queue:
>     https://patchwork.ozlabs.org/project/buildroot/list/
> 
> Since there's not many of us doing reviews/tests, it takes time.
> 
> If you want to increase the likelyhood your patches are reviewed soon
> (and I've already started), you can help reduce the patch queue:
> 
>   - get a patch (not yours), apply it to your Buildroot tree, build a
>     configuration with that patch and test it (as much as you can, at
>     least build-test in various target configurations: arm, mips...
>     LE/BE, glibc/uClibc/musl, internal/external toolchain...) and
> report your findings to the list
> 
>   - get a patch (not yours), look at it, and see if it fits in the
>     Buildroot 'spirit' (code style, mandatory information,
> licensing...) and report to hte list.
> 
> See:
>     http://buildroot.net/downloads/manual/manual.html#_contributing_to_buildroot
>     http://buildroot.net/downloads/manual/manual.html#_reviewing_and_testing_patches
> 
> Regards,
> Yann E. MORIN.
> 
