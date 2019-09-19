From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Sep 2019 23:26:05 +0200
Subject: [Buildroot] [PATCH v4 2/2] package/python-simplelogging: new
 package
In-Reply-To: <20190916162306.5202-1-offougajoris@gmail.com>
References: <20190916162306.5202-1-offougajoris@gmail.com>
Message-ID: <20190919232605.3708f711@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Sep 2019 18:23:03 +0200
Joris Offouga <offougajoris@gmail.com> wrote:

> Simplelogging is easier implementation of logging.
> 
> Signed-off-by: Joris Offouga <offougajoris@gmail.com>
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  Changes v3 -> v4
>  Fix correct LICENSE type
>  Add Reviewed-by 
>  
>  DEVELOPERS                                         |  1 +
>  package/Config.in                                  |  1 +
>  package/python-simplelogging/Config.in             |  7 +++++++
>  .../python-simplelogging/python-simplelogging.hash |  5 +++++
>  .../python-simplelogging/python-simplelogging.mk   | 14 ++++++++++++++
>  5 files changed, 28 insertions(+)
>  create mode 100644 package/python-simplelogging/Config.in
>  create mode 100644 package/python-simplelogging/python-simplelogging.hash
>  create mode 100644 package/python-simplelogging/python-simplelogging.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
