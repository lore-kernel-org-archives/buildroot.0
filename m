From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jun 2014 15:04:15 +0200
Subject: [Buildroot] [PATCH 1/1] New package: qt5webkitexamples
In-Reply-To: <201406131547.31164.fatih.asici@gmail.com>
References: <1402481120-13154-1-git-send-email-massimocallegari@yahoo.it>
 <201406131547.31164.fatih.asici@gmail.com>
Message-ID: <20140613150415.2ce0c01b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fatih A??c?,

On Fri, 13 Jun 2014 15:47:31 +0300, Fatih A??c? wrote:

> > b/package/qt5/qt5webkitexamples/Config.in new file mode 100644
> > index 0000000..18cb476
> > --- /dev/null
> > +++ b/package/qt5/qt5webkitexamples/Config.in
> > @@ -0,0 +1,12 @@
> > +config BR2_PACKAGE_QT5WEBKITEXAMPLES
> > +	bool "qt5webkit examples"
> 
> What about hiding this menu entry and making this package default if 
> BR2_PACKAGE_QT5BASE_EXAMPLES?

Since it's a separate package/tarball upstream, I'd prefer to have the
option to build/install it or not.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
