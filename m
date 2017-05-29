From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 29 May 2017 09:53:45 +0200
Subject: [Buildroot] [PATCH 2/2] docker-engine: bump to version
	17.05.0-ce
In-Reply-To: <CA+h8R2rbzf5vxZkCXWC0AkL_KBptqyo_W_bGrTiUabYhgRHRxQ@mail.gmail.com>
References: <20170510040050.31744-1-christian@paral.in>
 <20170510040050.31744-2-christian@paral.in>
 <CAPi7W81HP7E4Ce+_CRVJ9dhjodKWEVhL4v9xS=5bJ59eMf1WVg@mail.gmail.com>
 <CA+h8R2p=1Zd6vR_J=aW__T5dh9ct8X6CMpK72Ym2p7n3gutO1g@mail.gmail.com>
 <CA+h8R2rbzf5vxZkCXWC0AkL_KBptqyo_W_bGrTiUabYhgRHRxQ@mail.gmail.com>
Message-ID: <CAPi7W828JbwArgbNe81qXV_L8+1d3jMxR4CO1EpvrTeU9vx+ZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christian,

2017-05-26 2:27 GMT+02:00 Christian Stewart <christian@paral.in>:

> Hi Fabrice, All,
>
> On Wed, May 10, 2017 at 11:08 AM, Christian Stewart <christian@paral.in>
> wrote:
> > On Wed, May 10, 2017 at 3:23 AM, Fabrice Fontaine
> > <fontaine.fabrice@gmail.com> wrote:
> >> Since April 18th (and so starting from this release), docker has been
> >> renamed "moby":
> > I recommend we take the following steps:
> >
> >  - Apply this series now, and try to get it into the next buildroot
> > release as it's a bugfix and general release of Docker corresponding
> > with this Buildroot release (2017.05).
> >  - In next, rename docker-containerd to containerd, and have the
> > docker-engine package simlink /usr/bin/docker-containerd to
> > /usr/bin/containerd, as is done in my other patch series introducing
> > docker-init. I am happy to supply the series to do this change.
>
> Things have settled a little bit:
>
>  - Docker CLI has been moved to https://github.com/docker/cli
>  - Dockerd remains in https://github.com/moby/moby under cmd/dockerd
>
> We should still wait until Docker spins their next release, or their
> next rc, before we can really tell what the build process will look
> like for the Docker client and daemon. It's likely that the package
> needs to be split into multiple - one for the client, one for the
> daemon, etc.
>
> I would recommend still merging this series immediately - everything
> still works here and will forever (according to the Docker project's
> guarantees) and it's important to get the latest version merged into
> Buildroot before we go about splitting these packages up in the
> future.
>
I agree with your proposal.

>
> Thanks!
> Christian Stewart
>

Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170529/48b95750/attachment.html>
