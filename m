From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 3 Jan 2020 17:39:13 +0100
Subject: [Buildroot] [PATCH 07/11] support/scripts/pkg-stats: store
 dependencies of package
In-Reply-To: <20200103162941.6b428eec@windsurf>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
 <20200103151849.10956-8-heiko.thiery@gmail.com>
 <20200103162941.6b428eec@windsurf>
Message-ID: <CAEyMn7YhmtuRSfZscUqyNm7wEWcye5x9YZO=5T8VPPzbEBuErQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fr., 3. Jan. 2020 um 16:29 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Fri,  3 Jan 2020 16:18:44 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>
> Storing those dependencies do not make sense, because dependencies are
> completely different depending on the Buildroot configuration. Packages
> have optional dependencies, some dependencies on host packages only
> exist depending on the system configuration, etc. So exposing those
> dependencies is never going to give anything that is correct.

Thought it is a good idea because I saw that on the
https://layers.openembedded.org/layerindex/recipe/45257/. They also
show the dependencies with a note that this can differ dependent on
the real used configuration. But if you think it is too confusing I
can drop that.

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
