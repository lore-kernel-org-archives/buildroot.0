From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Dec 2018 15:25:25 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-12-02
In-Reply-To: <20181203145612.150037bc@windsurf.home>
References: <20181203070035.5D6B220D2E@mail.bootlin.com>
 <CA+Vb7ho5wgKxatazqbL4sdmtiEXiwSH8zw+LdYGr5vySBa0QBw@mail.gmail.com>
 <20181203134517.40729dd9@windsurf.home>
 <CAMRc=MeGJzA7wdAKz7UXXwvDmnDE+mgPK+kNi_UxbXgfn+RFHQ@mail.gmail.com>
 <20181203144457.33a80c9d@windsurf.home>
 <CAMRc=MdwOpMmwhjvHMOfb_wBgwQAq4_TAdUUDRSi4eYReYTcZg@mail.gmail.com>
 <20181203145612.150037bc@windsurf.home>
Message-ID: <CAMRc=Mc1SqoZKZ45xT7LS9g=0mpA7Av1AJF6qEZmeFeBgL+qrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pon., 3 gru 2018 o 14:56 Thomas Petazzoni
<thomas.petazzoni@bootlin.com> napisa?(a):
>
> Hello,
>
> On Mon, 3 Dec 2018 14:51:05 +0100, Bartosz Golaszewski wrote:
>
> > > > this failure (and others in pulseview) are due to libsigrokdecode.h
> > > > being included when libsigrokdecode is not built. It's a bug in
> > > > pulseview. I already have a patch and will submit it later today both
> > > > for buildroot as well as upstream.
> > >
> > > Well, the error that Philipp points to is in libtorrent-rasterbar,
> > > which has nothing to do with libsigrokdecode, and quite probably
> > > doesn't use it. Are you sure the issue is related ?
> >
> > What I meant was that I found the issue and it has nothing to do with
> > libtorrent. I should have expressed myself clearer.
>
> How can a bug in pulseview/libsigrokdecode after libttorrent-rasterbar ?
>
> See the build failures we are talking about, they affect the
> libtorrent-rasterbar package:
>

I'm not following you here I'm afraid. This has nothing to do with any
other package - this is purely a pulseview bug. It appears after my
previous version bump and is confined to pulseview.

Bart
