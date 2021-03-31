From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Mar 2021 09:23:22 +0200
Subject: [Buildroot] [PATCH 4/4] package/mender: install dbus
 authentication file if dbus is selected
In-Reply-To: <CAFSsvmrKsuhqCoLcgcpxqpS=k9JmDc41ZuZdoYhqb8U_7D9T0A@mail.gmail.com>
References: <20210320222835.3951325-1-aduskett@gmail.com>
 <20210320222835.3951325-5-aduskett@gmail.com>
 <20210330223117.1c2376cf@windsurf.home>
 <CAFSsvmrKsuhqCoLcgcpxqpS=k9JmDc41ZuZdoYhqb8U_7D9T0A@mail.gmail.com>
Message-ID: <20210331092322.04a6bfa0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 30 Mar 2021 17:09:30 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> > Do we really need DBus to be built/installed before ? It seems like the
> > hook below only installs an extra DBus configuration file.
> >  
> It isn't actually. I can resubmit the patch with just the $(INSTALL)
> if you want me to!

Thanks for the confirmation, I have applied the patch after dropping
the dbus dependency. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
