From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 14:56:55 +0200
Subject: [Buildroot] Xenomai 3.x
In-Reply-To: <CAH-u=817AGbG8SXv=aiCus1vna6Jx2iO=xatLcufKGwuVjKGZA@mail.gmail.com>
References: <CAH-u=80UriOruAmAcS0uiJfXzEXTB6LeM+OwV9=vB0D7+e3xgw@mail.gmail.com>
 <0b8401d21edd$b0d2b3d0$12781b70$@chordia.co.uk>
 <CAH-u=80h6GZDrk9inr751BjR5m_96tH71BWBOOKiKCJ54PGq8A@mail.gmail.com>
 <0bdd01d21eef$f42d1d20$dc875760$@chordia.co.uk>
 <CAH-u=817AGbG8SXv=aiCus1vna6Jx2iO=xatLcufKGwuVjKGZA@mail.gmail.com>
Message-ID: <20161005145655.31cf0349@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 5 Oct 2016 14:41:08 +0200, Jean-Michel Hautbois wrote:

> Right now, I am still hesitating, as I can have one xenomai.mk file
> which would be pretty much the same for Cobalt, but needs some
> modifications for Mercury. And you get a lot of ifeq() statements
> which is not nice.
> Or, having one xenomai-2.mk and one xenomai-3.mk (or anything similar).
> Or, having one xenomai.mk which would support Xenomai 2.x and Xenomai
> 3.x Cobalt only, and one xenomai-mercury.mk which would add support
> for mercury options.

For now, I think you should just start with a package/xenomai3/ package
that handles all aspects of Xenomai 3 (i.e Cobalt and Mercury). Once
you have something working, we can see what it looks like, and discuss
whether merging with xenomai.mk is appropriate or not.

What do you think about such an approach?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
