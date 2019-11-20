From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 20 Nov 2019 03:38:40 -0600
Subject: [Buildroot] [PATCH 1/9] package/rcw: upgrade the rcw version to
 LSDK-19.09
In-Reply-To: <20191120103204.19a15798@windsurf.home>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
 <20191120040725.32207-2-jerry.huang@nxp.com>
 <8ef6b0156f54102d837ecfc429ae810d@walle.cc>
 <20191120103204.19a15798@windsurf.home>
Message-ID: <CANQCQpbZdy0q_qvRf8AWKu8wVFTNh8o9fjY7=UDeiKmU8zhnGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Michael,

On Wed, Nov 20, 2019 at 3:32 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Wed, 20 Nov 2019 10:21:12 +0100
> Michael Walle <michael@walle.cc> wrote:
>
> > > diff --git a/package/rcw/rcw.hash b/package/rcw/rcw.hash
> > > index 7de1ec659a..3fbb5d167f 100644
> > > --- a/package/rcw/rcw.hash
> > > +++ b/package/rcw/rcw.hash
> >
> > sorry for missing the initial commit.. but IMHO the package name "rcw"
> > is _really_ bad. because its too generic. what if another SoC also has a
> > package rcw. So if it is still possible, could it be renamed to
> > rcw-qoriq ?
>
> True, rcw is very short and quite generic. Matt, what do you think?
>

Michael, good points, maybe we could append a prefix to make it
freescale-qoriq-rcw?

Matt
