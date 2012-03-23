From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Mar 2012 09:45:57 +0100
Subject: [Buildroot] ofono package
In-Reply-To: <CAAfyv356rwaUgjL2yF+=iaBBQ7zMKZC3pz91bxz=cUwSHnb9sw@mail.gmail.com>
References: <CAAfyv35Rq_ad_obvHC2QZdhBvebLqpsRO7G0B4qpkGZuEYamuA@mail.gmail.com>
 <CAGm1_ks7QkKyFS7wWPMi3ytu4d2QU=k=gVEcnq6ENoA-CM3sKQ@mail.gmail.com>
 <CAAfyv356rwaUgjL2yF+=iaBBQ7zMKZC3pz91bxz=cUwSHnb9sw@mail.gmail.com>
Message-ID: <20120323094557.05470559@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 23 Mar 2012 09:41:59 +0100,
Belisko Marek <marek.belisko@gmail.com> a ?crit :

> >> When run make I always got:
> >> checking for dbus_watch_get_unix_fd in -ldbus-1... yes
> >> checking for dbus_connection_can_send_type in -ldbus-1... yes
> >> checking for CAPNG... yes
> >> checking for USB... yes
> >> checking for BLUEZ... no
> >> configure: error: Bluetooth library >= 4.30 is required

Can you post:

 * The relevant part of configure.{in,ac} which implements the BLUEZ
   check

 * The relevant part of config.log (which explains why the test is
   failing)

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
