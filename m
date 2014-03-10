From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Mon, 10 Mar 2014 15:12:06 -0500
Subject: [Buildroot] [PATCH 2/3] libee: new package
In-Reply-To: <20140310191058.GU4249@tarshish>
References: <1394459809-22174-1-git-send-email-clshotwe@rockwellcollins.com>
 <1394459809-22174-2-git-send-email-clshotwe@rockwellcollins.com>
 <20140310191058.GU4249@tarshish>
Message-ID: <OFD55373F6.70F11198-ON86257C97.006EE474-86257C97.006EF778@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch Siach <baruch@tkos.co.il> wrote on 03/10/2014 02:10:58 PM:

> > --- /dev/null
> > +++ b/package/libee/Config.in
> > @@ -0,0 +1,18 @@
> > +config BR2_PACKAGE_LIBEE
> > +   bool "libee"
> 
> select BR2_PACKAGE_LIBESTR?
> 
> baruch

I'll add the select statement.

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 
