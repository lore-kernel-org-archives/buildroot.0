From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 24 Apr 2020 16:01:01 +0200
Subject: [Buildroot] [PATCH 1/3] package/mbedtls: add
 BR2_PACKAGE_MBEDTLS_X509_UNSUPPORTED_CRITICAL_EXTENSION
In-Reply-To: <20200424152143.45b838c3@windsurf.home>
References: <20200422192059.790299-1-fontaine.fabrice@gmail.com>
 <20200423220905.06d9dc59@windsurf.home>
 <20200423232758.zwos3e5f55pz23ld@einstein.dilieto.eu>
 <20200424090710.GA5035@scaer>
 <20200424112639.xdzs4ggqtijcij74@einstein.dilieto.eu>
 <20200424113226.mhi7l3r46wluyu7v@einstein.dilieto.eu>
 <20200424114813.GH5035@scaer>
 <20200424131108.ntkqvq7dlwgbsx6k@einstein.dilieto.eu>
 <CAPi7W810oEfbH60FeNzOO=-rt1VZFWgpXSz87yX-aWS9Q_2iAw@mail.gmail.com>
 <20200424152143.45b838c3@windsurf.home>
Message-ID: <CAPi7W83ckzDLDPug8dGiGmH6-t9WMRtjnAegpYXnRxOahV4EfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Le ven. 24 avr. 2020 ? 15:21, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Fri, 24 Apr 2020 15:20:19 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > > I propose making BR2_PACKAGE_UACME_UALPN depend on !BR2_PACKAGE_MBEDTLS.
> > > Would that be acceptable?
> > I think it should depend on !BR2_PACKAGE_UACME_MBEDTLS (added by the
> > second patch of this serie).
> > Otherwise, a user won't be able to select ualpn with a gnutls-enabled
> > uacme if he has also enabled mbedlts for an other purpose.
>
> Or instead make sure ualpn can be enabled only if either gnutls or
> openssl are available, and tweak the .mk file to use gnutls or openssl
> instead of mbedtls when ualpn is enabled.
OK, v2 sent.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
