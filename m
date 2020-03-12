From: Carlos Santos <unixmania@gmail.com>
Date: Thu, 12 Mar 2020 10:54:52 -0300
Subject: [Buildroot] [PATCH] package/util-linux: fix build for riscv64
 and powerpc64le
In-Reply-To: <20200312145005.3c16bec0@windsurf>
References: <20200312114759.31764-1-unixmania@gmail.com>
 <20200312145005.3c16bec0@windsurf>
Message-ID: <CAJ4jsafdXUTt262zgxXykxpYK9AyVjt3_MsSVf8RJ5v3m=hZGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 12, 2020 at 10:50 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Carlos,
>
> On Thu, 12 Mar 2020 08:47:59 -0300
> unixmania at gmail.com wrote:
>
> > From: Carlos Santos <unixmania@gmail.com>
> >
> > Pull two upstream patches that fix the declaration of pidfd_open and
> > pidfd_send_signal.
> >
> > Fixes:
> >   http://autobuild.buildroot.net/results/2396b04478f9d358b94f2e2e05540625ddc9f205/
> >   http://autobuild.buildroot.net/results/ed4b5ec61bd33d3ccf0ebb16000af46d0499366d/
> >
> > Signed-off-by: Carlos Santos <unixmania@gmail.com>
>
> We normally require to sign-off on the patches themselves, when they
> are added to Buildroot packages.

The patches are not mine and are already properly signed:

Signed-off-by: Sami Kerola <kerolasa@iki.fi>
Signed-off-by: Karel Zak <kzak@redhat.com>

-- 
Carlos Santos <unixmania@gmail.com>
