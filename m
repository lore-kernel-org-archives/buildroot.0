From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 25 Feb 2014 15:07:59 +0100
Subject: [Buildroot] [PATCH 2/2] manual: add virtual package tutorial.
In-Reply-To: <20140224190104.GC11048@free.fr>
References: <1393235404-2693-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1393235404-2693-3-git-send-email-eric.le.bihan.dev@free.fr>
 <20140224190104.GC11048@free.fr>
Message-ID: <20140225140757.GB30238@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 24, 2014 at 08:01:04PM +0100, Yann E. MORIN wrote:
>
> 'virtual-package' is not an infrastructure [ie. you can't use:
> $(eval $(virtual-package)) ], so I would suggest to just use:
>
>     Virtual package tutorial
>     ^^^^^^^^^^^^^^^^^^^^^^^^
>
Understood.

> > +First, let's create the virtual package.
> > +
> > +.Virtual package +Config.in+ file
> > +=================================
>
> The formatting of the title is weird. Here's what I've changed:
>
>     Virtual package +Config.in+ file
>     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
>
> (notice: no leading dot, and an empty line after the ^^^ line)
This was not a title, but an example, as I used +adding-packages-generic.txt+
for inspiration. I thought it was useful to have the code snippets listed in
the example section, so the user could quickly jump to them. But it is true
that:

1. not all the code snippets are listed as examples.
2. the Ascidoc example syntax, mixed with a code snippet, hurts the eyes
   (either in text or in the generated HTML).

I'll change to plain and simple titles.

Best regards,
ELB
