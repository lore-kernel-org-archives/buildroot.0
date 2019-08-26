From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 26 Aug 2019 21:21:17 +0200
Subject: [Buildroot] [PATCH v2] package/iputils: add configs to select
 which binaries are built
In-Reply-To: <c6bb6178-d468-a95f-804c-b7958abb6f90@gmail.com>
References: <20190826180719.3270-1-alejandro.gonzalez.correo@gmail.com>
 <c6bb6178-d468-a95f-804c-b7958abb6f90@gmail.com>
Message-ID: <20190826192116.GB12246@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alejandro,

> El 26/8/19 a las 20:07, Alejandro Gonz?lez escribi?:
> > By default, the iputils build script might build binaries which are
> > useless for certain applications, like tftpd. Those binaries will bloat
> > the target filesystem unless a post-build script removes them manually,
> > which is cumbersome and doesn't shorten build times.

> > These changes add Kconfig options which let the user select what
> > binaries are built with ease.

> > Signed-off-by: Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

I understand the concern, but not sure if this is a buildroot policy.
IMHO there is a concern not to put too many options in Kconfig.
Thomas, Petr, am I right?

Kind regards,
Petr
