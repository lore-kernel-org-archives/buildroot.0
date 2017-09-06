From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 08:54:09 +0200
Subject: [Buildroot] [PATCH] libqmi: udev and qmi-over-mbim are optional
In-Reply-To: <CAAP7ucKNVWs7G-XkDk-9QCRadWdDMTLN6nG2NevSrMjw6Uii0g@mail.gmail.com>
References: <20170905100327.21421-1-aleksander@aleksander.es>
 <20170905213604.61141da0@windsurf.lan>
 <CAAP7ucKNVWs7G-XkDk-9QCRadWdDMTLN6nG2NevSrMjw6Uii0g@mail.gmail.com>
Message-ID: <20170906085409.5de05fa2@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 5 Sep 2017 21:45:19 +0200, Aleksander Morgado wrote:

> > ... and libmbim also has plenty of dependencies that you need to
> > propagate here, including BR2_PACKAGE_HAS_UDEV.
> >  
> 
> Oh, I assumed that was somehow automatic... Does this mean that if the
> deps of a library are updated at some point in time, all the apps
> depending on the library also need to get updated to add the new dep?

Yes, exactly. When we review patches adding new dependencies to an
existing package, we are always careful that those new dependencies are
propagated.

> Yes, probably that's a much simpler option. Will suggest a new patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
