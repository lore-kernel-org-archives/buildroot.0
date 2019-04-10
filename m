From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 10 Apr 2019 19:31:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/civetweb: fix static build with
 openssl
In-Reply-To: <a053693b-ca55-e2a3-8fb2-5c6adba9fe31@micronovasrl.com>
References: <20190407163231.20134-1-fontaine.fabrice@gmail.com>
 <20190410191158.3b5ad608@windsurf.home>
 <a053693b-ca55-e2a3-8fb2-5c6adba9fe31@micronovasrl.com>
Message-ID: <CAPi7W80_RvJ5aaWBQUgQw3wq+9rdHQoYq7ExiJxWCV7kABKwng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giulio and Thomas,

Le mer. 10 avr. 2019 ? 19:21, Giulio Benetti
<giulio.benetti@micronovasrl.com> a ?crit :
>
> Il 10/04/2019 19:11, Thomas Petazzoni ha scritto:
> > On Sun,  7 Apr 2019 18:32:31 +0200
> > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> >
> >> Use pkg-config to retrieve openssl dependencies such as atomic
> >>
> >> Fixes:
> >>   - http://autobuild.buildroot.org/results/b2e210bdefe84f4ec9cfda79a33d81788fb7e66c
> >>
> >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> >> ---
> >>   package/civetweb/civetweb.mk | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > Gaah, sorry, I'm only seeing this patch now, and in the mean time, I
> > have merged a similar patch from Giulio. Sorry about that :-/
>
> I was sure to have checked patchwork before submitting.
> I'm sorry too Fabrice.
It's ok :-)
>
> --
> Giulio Benetti
> CTO
>
> MICRONOVA SRL
> Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
> Tel. 049/8931563 - Fax 049/8931346
> Cod.Fiscale - P.IVA 02663420285
> Capitale Sociale ? 26.000 i.v.
> Iscritta al Reg. Imprese di Padova N. 02663420285
> Numero R.E.A. 258642
Best Regards,

Fabrice
