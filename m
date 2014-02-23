From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2014 20:04:07 +0100
Subject: [Buildroot] [PATCH v2 1/1] manual: add virtual package tutorial.
In-Reply-To: <20140219141950.GA25812@pc-eric>
References: <1392390673-30343-1-git-send-email-eric.le.bihan.dev@free.fr>
 <CAHXCMMJuED9xj9wVS0d0d+USa=-7_MdD6ZwoKQNj3zyg2+1vpQ@mail.gmail.com>
 <20140219141950.GA25812@pc-eric>
Message-ID: <20140223190407.GE32759@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-02-19 15:19 +0100, Eric Le Bihan spake thusly:
> On Tue, Feb 18, 2014 at 09:34:41PM +0100, Samuel Martin wrote:
> [...]
> > > +[[virtual-package-tutorial]]
> > > +How to add a virtual package
> > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > +
> > > +In Buildroot, a virtual package is a package whose functionalities are
> > > +provided by one or more packages, referred to as 'providers'.
> > > +
> > > +For example, 'OpenGL ES' is an API for 2D and 3D graphics on embedded systems.
> > > +The implementation of this API is different for the 'Allwinner Tech Sunxi' and
> > > +the 'Texas Instruments OMAP35xx' plaftorms. So +libgles+ will be a virtual
> > > +package and +sunxi-mali+ and +ti-gfx+ will be the providers.
> >
> > The generic way of presenting the virtual/provider "infra" in Buildroot is:
> > we want to use the virtual/provider infrastructure when there is one
> > API, but several packages implementing this API, so we want an
> > extensible mechanism allowing to choose what implementation we want in
> > the target rootfs.
> I will update the text in order to put emphasis on this idea.

How are your changes going?

There are quite a few improvements to the manual being upstreamed. Your
changes would make for another nice addition.

Do you think you could resubmit sometime next week, so this has a chance
to go in before the release?

Thanks for your work on this! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
