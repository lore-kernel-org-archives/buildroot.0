From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 7 Aug 2018 08:54:15 -0500
Subject: [Buildroot] [PATCH] package/proftpd: add
 BR2_PACKAGE_PROFTPD_MOD_SFTP
In-Reply-To: <87r2jab83j.fsf@tkos.co.il>
References: <1533648866-61581-1-git-send-email-matthew.weber@rockwellcollins.com>
 <87r2jab83j.fsf@tkos.co.il>
Message-ID: <CANQCQpbT9m=mvz7pQjuvMrR3dJrzdf+3PJKYhJX6-rRxOYmmJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Tue, Aug 7, 2018 at 8:48 AM Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Matt,
>
> Matt Weber writes:
> > +ifeq ($(BR2_PACKAGE_PROFTPD_MOD_SFTP),y)
> > +PROFTPD_CONF_OPTS += --enable-openssl
>
> Don't you need openssl/libressl as build time dependency?

Yeah, I'll add a check for BR2_PACKAGE_OPENSSL.   By chance, do you
know if there is a risk of library compatibility between libopenssl
and libressl?

Matt
