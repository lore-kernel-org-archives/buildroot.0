From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Feb 2013 09:24:01 +0100
Subject: [Buildroot] Buildroot at ELC: review/suggestions needed
In-Reply-To: <201302100047.23872.yann.morin.1998@free.fr>
References: <20130209195709.323b9f5e@skate>
 <201302100047.23872.yann.morin.1998@free.fr>
Message-ID: <20130211092401.086be57e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 10 Feb 2013 00:47:23 +0100, Yann E. MORIN wrote:

> I would add arrows to the lines, to further ensure that what is
> dark-green and brown is input to buildroot, while what is gray
> is the output.

I would love to as well, but arrows are not immediately available in
Inkscape, you have to draw them manually. And since my designer skills
are very, very limited, I gave up on this.

> Besides, I've counted packages with:
>     $ grep -r -E -e '^[^[:space:]]+_VERSION[[:space:]]*:?='   \
>     | $(find package/ -type f -name '*.mk')                 \
>     | wc -l
>     944
> 
> So you can bump the number of packages to 900+. But beware: be
> consistent between the poster and the slides.

Indeed, thanks.

> >  * Give me suggestions on what to demonstrate. I will prepare a
> >    slideshow of 10-20 slides that continuously loops (it should
> 
> 20 slides is too much. The people attending wil not have time to wait
> to see the complete slideshow, so I'd stick with no more than 10
> slides with a very few points in each, switching after 7-10 seconds.

Ok. I will see how many topics I believe should be mentioned. But I
don't think we need to limit those too much: people don't necessarily
need to watch the entire slide set. As long as they get some of the
information, that's good enough.

> Points for those slides (out-of-order, obviously):

Thanks for those suggestions!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
