From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 4 Apr 2014 21:18:22 +0200
Subject: [Buildroot] [PATCH] postgresql: new package
In-Reply-To: <533DD8E6.9000609@trzebnica.net>
References: <1396249169-14126-1-git-send-email-ps.report@gmx.net>,
 <533DD8E6.9000609@trzebnica.net>
Message-ID: <trinity-98a66737-6ffb-4749-aac8-33bc61adf9a0-1396639102682@3capp-gmx-bs34>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jerzy,


> Gesendet: Donnerstag, 03. April 2014 um 23:55 Uhr
> Von: "Jerzy Grzegorek" <jerzy.grzegorek@trzebnica.net>
> An: "Peter Seiderer" <ps.report@gmx.net>, buildroot at busybox.net
> Betreff: Re: [Buildroot] [PATCH] postgresql: new package
>
[...]
> 
> > diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> > new file mode 100644
> > index 0000000..fee4aed
> > --- /dev/null
> > +++ b/package/postgresql/postgresql.mk
> > @@ -0,0 +1,54 @@
> > +################################################################################
> > +#
> > +# postgresql
> > +#
> > +################################################################################
> > +
> > +POSTGRESQL_VERSION = 9.3.3
> > +POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
> > +POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
> > +POSTGRESQL_LICENSE = PostgreSQL
> > +POSTGRESQ_LICENSE_FILES = COPYRIGHT
> 
> typo
> POSTGRESQL_LICENSE_FILES = COPYRIGHT
> 
> 
> Regards,
> Jerzy
> 

Thank you for the review, will fix this on for the next version...
Regards,
Peter
