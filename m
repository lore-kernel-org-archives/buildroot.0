From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Dec 2018 11:18:48 +0100
Subject: [Buildroot] [PATCH v5] netsurf: new package
In-Reply-To: <20181205134040.20861-1-francois.perrad@gadz.org>
References: <20181205134040.20861-1-francois.perrad@gadz.org>
Message-ID: <20181211111848.6b71a5b3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Wed,  5 Dec 2018 14:40:40 +0100, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  .../0001-avoid-system-perl-dependencies.patch | 29 ++++++++
>  package/netsurf/Config.in                     | 42 ++++++++++++
>  package/netsurf/netsurf.hash                  |  3 +
>  package/netsurf/netsurf.mk                    | 67 +++++++++++++++++++
>  6 files changed, 143 insertions(+)
>  create mode 100644 package/netsurf/0001-avoid-system-perl-dependencies.patch
>  create mode 100644 package/netsurf/Config.in
>  create mode 100644 package/netsurf/netsurf.hash
>  create mode 100644 package/netsurf/netsurf.mk

A few build failures have popped up:

  http://autobuild.buildroot.net/?reason=netsurf-3.8

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
