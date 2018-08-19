From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 19 Aug 2018 19:15:11 +0200
Subject: [Buildroot] [RFC v3 2/4] meson: change from global to per
 package cross-compilation.conf
In-Reply-To: <20180819152206.7b15fce9@windsurf>
References: <20180719204355.10465-1-ps.report@gmx.net>
 <20180719204355.10465-2-ps.report@gmx.net>
 <20180816135745.71ed73f2@windsurf>
 <20180819011512.11fad995@gmx.net>
 <20180819152206.7b15fce9@windsurf>
Message-ID: <20180819191511.3c38bb60@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,


On Sun, 19 Aug 2018 15:22:06 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Sun, 19 Aug 2018 01:15:12 +0200, Peter Seiderer wrote:
> 
> > The CFLAGS are ignored, e.g. with 'LIBDRM_CONF_ENV += CFLAGS=-DAO_NO_SPARC_V9' in package/libdrm/libdrm.mk:
> > 
> > 	$ make libdrm V=1  
> 
> It seems weird, no? It is documented to be working, and even at runtime
> it tells you "I am going to use those additional CFLAGS". Isn't this a
> bug or a misuse of meson from us ?
> 

Bug or feature of the cross-compilation.conf usage? Will take a look at
the meson sources....

Regards,
Peter

> I would really prefer to understand what is going on here instead of
> having to generate per-package .conf files.
> 
> Thanks!
> 
> Thomas
