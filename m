From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 8 Mar 2020 16:33:27 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/bearssl: new package
In-Reply-To: <20200308162106.706e131f@windsurf.home>
References: <20200227163042.3723042-1-fontaine.fabrice@gmail.com>
 <20200308162106.706e131f@windsurf.home>
Message-ID: <CAPi7W81C80e16KmP9NtobYxpvx1ythYnbGW4eczdbizJsmT2HA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le dim. 8 mars 2020 ? 16:21, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Thu, 27 Feb 2020 17:30:42 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > BearSSL is an implementation of the SSL/TLS protocol (RFC 5246) written
> > in C
> >
> > https://bearssl.org
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  DEVELOPERS                   |  1 +
> >  package/Config.in            |  1 +
> >  package/bearssl/Config.in    |  7 +++++++
> >  package/bearssl/bearssl.hash |  3 +++
> >  package/bearssl/bearssl.mk   | 39 ++++++++++++++++++++++++++++++++++++
> >  5 files changed, 51 insertions(+)
> >  create mode 100644 package/bearssl/Config.in
> >  create mode 100644 package/bearssl/bearssl.hash
> >  create mode 100644 package/bearssl/bearssl.mk
>
> I did a few tweaks to the .mk file, and applied to next. Thanks!
Thanks for those tweaks however was it intentional to use = instead of
+= for BEARSSL_TARGETS?
Due to this change, bearssl will only build the dynamic library with
BR2_SHARED_STATIC_LIBS.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
