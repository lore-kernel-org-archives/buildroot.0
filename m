From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 30 Oct 2018 22:27:53 +0100
Subject: [Buildroot] [PATCH 1/2] package/network-manager: bump version
 to 1.10.8
In-Reply-To: <20181030212423.GB16998@x230>
References: <20181030212053.9833-1-bernd.kuhls@t-online.de>
 <20181030212423.GB16998@x230>
Message-ID: <20181030212752.GC16998@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

> ...
> >  NETWORK_MANAGER_VERSION_MAJOR = 1.10
> > -NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
> > +NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).8

> Thanks for your patch.
> There is new stable branch, could you bump it into 1.12.2?

> https://wiki.gnome.org/Projects/NetworkManager
> https://download.gnome.org/sources/NetworkManager/1.12/NetworkManager-1.12.2.tar.xz

Wiki page is outdated. Latest stable branch is 1.14.x. Can you bump to 1.14.4?
http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.14/
http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.14/NetworkManager-1.14.4.tar.xz
http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.14/NetworkManager-1.14.4.sha256sum

Kind regards,
Petr
