From: Carlos Santos <unixmania@gmail.com>
Date: Mon, 30 Mar 2020 08:20:25 -0300
Subject: [Buildroot] [PATCH 0/3] Fix and improve the S02sysctl init
 script
In-Reply-To: <CAJ4jsac6RJdTCw1ige8ZrWidry7T1BiQyrYmXyUjnuwf9u0GOA@mail.gmail.com>
References: <20200329234924.14505-1-unixmania@gmail.com>
 <20200330072605.2dc561af@windsurf.home>
 <CAJ4jsac6RJdTCw1ige8ZrWidry7T1BiQyrYmXyUjnuwf9u0GOA@mail.gmail.com>
Message-ID: <CAJ4jsaeX_XmzwGNH-vghMqnGaWgaYmLA=zbxnn6oqcU7h6bcmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 30, 2020 at 8:16 AM Carlos Santos <unixmania@gmail.com> wrote:
>
> On Mon, Mar 30, 2020 at 2:26 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > On Sun, 29 Mar 2020 20:49:21 -0300
> > unixmania at gmail.com wrote:
> >
> > > Carlos Santos (3):
> > >   pakage/busybox: use same S02sysctl script as procps-ng
> > >   package/procps-ng: add busybox-related comments to S02sysctl
> > >   pakage/procps-ng: use logger in S02sysctl only if it is available
> >
> > Thanks, series applied. I must admit I'm starting to be a bit worried
> > by the complexity of what should be a simple script to load sysctl
> > values, but OK.
>
> I don't like it, either, and will submit a patch to kmod fixing the
> behavior when the --system option is passed. Triggering the --ignore
> option seems to be a bug, since it is not documented in the manual
> page.

Errata: will submit a patch to procps-ng.

-- 
Carlos Santos <unixmania@gmail.com>
