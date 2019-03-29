From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 29 Mar 2019 17:28:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/openpgm: bump to version
 fcc46a1184df3383224c036789c360d739777496
In-Reply-To: <20190329171320.7042dd22@windsurf>
References: <20190325173750.3101-1-fontaine.fabrice@gmail.com>
 <20190325191008.5874b5e2@windsurf> <20190329171320.7042dd22@windsurf>
Message-ID: <CAPi7W805-EofdfHv9dg=RbXwKVDRRPo2Aa0hrG_9nCvs2=NbbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le ven. 29 mars 2019 ? 17:13, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Mon, 25 Mar 2019 19:10:08 +0100
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>
> > On Mon, 25 Mar 2019 18:37:50 +0100
> > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> >
> > > -OPENPGM_VERSION = release-5-2-122
> > > +OPENPGM_VERSION = fcc46a1184df3383224c036789c360d739777496
> >
> > Is there a motivation to bump from a well-defined version to some
> > random Git commit ?
>
> Any feedback on this question ?
Because latest official release is 6 years old, I asked upstream about
an official release: https://github.com/steve-o/openpgm/issues/62.
However, they do not have any hardware to run the test suite so I
think we can postpone this patch until we got an official release (if
we get one).
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards

Fabrice
