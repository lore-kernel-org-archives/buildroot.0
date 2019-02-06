From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 11:11:46 +0100
Subject: [Buildroot] [PATCH 1/1] gerbera: new package
In-Reply-To: <20180520082853.6753-1-fontaine.fabrice@gmail.com>
References: <20180520082853.6753-1-fontaine.fabrice@gmail.com>
Message-ID: <20190206111146.3cc28843@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 May 2018 10:28:53 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> A free media server.
> Stream your media to devices on your home network.
> 
> https://gerbera.io
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  DEVELOPERS                                     |   1 +
>  package/Config.in                              |   1 +
>  package/gerbera/0001-Fix-atrailers-build.patch |  48 +++++++++
>  package/gerbera/Config.in                      |  27 +++++
>  package/gerbera/S99gerbera                     |  38 +++++++
>  package/gerbera/config.xml                     | 139 +++++++++++++++++++++++++
>  package/gerbera/gerbera.hash                   |   3 +
>  package/gerbera/gerbera.mk                     | 114 ++++++++++++++++++++
>  8 files changed, 371 insertions(+)
>  create mode 100644 package/gerbera/0001-Fix-atrailers-build.patch
>  create mode 100644 package/gerbera/Config.in
>  create mode 100644 package/gerbera/S99gerbera
>  create mode 100644 package/gerbera/config.xml
>  create mode 100644 package/gerbera/gerbera.hash
>  create mode 100644 package/gerbera/gerbera.mk

Applied to master with the following changes:

    [Thomas:
     - fix S99gerbera to be compliant with the init script pattern
       that was recently put in place
     - add -l option in init script for logging
     - license code is GPL-2.0]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
