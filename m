From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Jun 2013 15:35:43 +0200
Subject: [Buildroot] [Q] Buildroot vs uCLinux
In-Reply-To: <CALF0-+UubeQyQPoiQf2y8f30BkbGO+9AzzirCRcfss1sfS724Q@mail.gmail.com>
References: <CALF0-+Wpm=JN0jOk8mu4QgaEvRvvbOw1mM4T6W8mYLMtSh2qSg@mail.gmail.com>
 <20130626000110.0bbb80cc@skate>
 <CALF0-+UubeQyQPoiQf2y8f30BkbGO+9AzzirCRcfss1sfS724Q@mail.gmail.com>
Message-ID: <20130626153543.4bf75096@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Wed, 26 Jun 2013 10:19:07 -0300, Ezequiel Garcia wrote:


> > Which CPU architecture is this platform
> > using?
> 
> Nios2

Nice! However, beware that Buildroot has no support for NIOS2. That
said, if you have prebuilt known-working toolchains for NIOS2, adding
support for this architecture in Buildroot is not very complicated.

Patches welcome!

> > There are apparently some not too old releases of uClinux-dist (october
> > 2012), but I'm not sure where the development is happening since the
> > CVS repository reference on the project web site seems to contain only
> > very old stuff.
> 
> Well, this is my very same concern: the lack of a healthy community
> on the uCLinux side. I can it's a good choice for MMU-less platforms
> given packages have been heavily patched. But this is not the case,
> and hence my perplexity.

Correct, we don't have as many noMMU fixes in Buildroot as uClibc-dist
has, but we're working on this progressively.

> Since this platforms come in two flavors (MMU and MMU-less) I was almost sure
> the reason is mostly historical.

Most likely yes.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
