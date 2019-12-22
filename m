From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 22 Dec 2019 22:40:43 +0100
Subject: [Buildroot] [PATCH] support/download/svn: generate reproducible
 svn archives
In-Reply-To: <20191222223650.1f44d3ca@windsurf>
References: <20191222213148.13762-1-heiko.thiery@gmail.com>
 <20191222223650.1f44d3ca@windsurf>
Message-ID: <CAEyMn7aZgVT2hmb8O4duNFeD4_x2_jkChOj9Cv3MAtVXZhQNLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am So., 22. Dez. 2019 um 22:36 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Sun, 22 Dec 2019 22:31:49 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > To generate a reproducible archive from a svn repository mainly the same
> > aproach is done like for the archives from a git repository.
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>
> Thanks. Could you check whether the tarballs that are now produced by
> this are identical to the tarballs we already have on
> sources.buildroot.org ?

I checked this for the fis package and unfortunately this is not the
case. Do you expect to have the same hashes?

> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
