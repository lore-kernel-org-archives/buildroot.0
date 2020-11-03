From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Nov 2020 11:35:28 +0100
Subject: [Buildroot] Enable gcc ADA support on latest LTS Buildroot
In-Reply-To: <CAEzkdfrXmUQc7N7a+j2zHayLLdzoUAy5kncQmewOwQ0-fSGVGA@mail.gmail.com>
References: <CAEzkdfrXmUQc7N7a+j2zHayLLdzoUAy5kncQmewOwQ0-fSGVGA@mail.gmail.com>
Message-ID: <20201103113528.1f8e61a5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matteo,

On Tue, 3 Nov 2020 08:53:48 +0100
Matteo Pampolini <matteo.pampolini@gmail.com> wrote:

> I would like to enable ADA language to gcc together with the needed target
> libraries, I'm using the latest LTS version of Buildroot. I saw an email
> with a patch some years ago but it seems it was never put into the
> Buildroot mainline. I tried just setting --enable-languages=ada in gcc
> options but it fails, both gcc 8.x and 9.x.

Could you give details about the failures you're seeing ?

> May you please help me? Why is there no such configuration option just like
> Fortran or D?

Because nobody really pushed for that, but if you do so, we will be
happy to include support for building gcc with Ada support. It
certainly makes sense to have that in Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
