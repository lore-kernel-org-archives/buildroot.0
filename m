From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Sun, 27 Jul 2014 14:01:46 -0400
Subject: [Buildroot] [PATCH] python-ipython: new package
In-Reply-To: <20140727155613.2db1ded5@free-electrons.com>
References: <1406228929-32485-1-git-send-email-eeppeliteloop@gmail.com>
 <20140727155613.2db1ded5@free-electrons.com>
Message-ID: <CAB4xu_3WftBJ5c2QW+O=wKsmWCjhEQWYAPkw8KP8mi6FMcvveA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 27, 2014 at 9:56 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Dear Philippe Proulx,
>
> On Thu, 24 Jul 2014 15:08:49 -0400, Philippe Proulx wrote:
> > Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
> > ---
> >  package/Config.in                                         |  1 +
> >  package/python-ipython/Config.in                          | 10 ++++++++++
> >  ...n-ipython-001-set-correct-python-executable-path.patch | 15 +++++++++++++++
> >  package/python-ipython/python-ipython.mk                  | 14 ++++++++++++++
> >  4 files changed, 40 insertions(+)
> >  create mode 100644 package/python-ipython/Config.in
> >  create mode 100644 package/python-ipython/python-ipython-001-set-correct-python-executable-path.patch
> >  create mode 100644 package/python-ipython/python-ipython.mk
>
> Thanks, patch applied.
>
Thanks!

> However, out of curiosity, I wonder what this package is used for on
> embedded systems? It weights 12+ MB, so it's quite huge.

It's only useful for faster Python testing/debugging on the target, used as a
temporary package that should be removed in production. Just like htop is
a nicer top, IPython is a nicer interactive Python shell.

Philippe Proulx
>
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
