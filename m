From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 23:55:02 +0200
Subject: [Buildroot] [PATCH 05/08] package/python-asgiref: new package
In-Reply-To: <20190804011631.86261-6-aduskett@gmail.com>
References: <20190804011631.86261-1-aduskett@gmail.com>
 <20190804011631.86261-6-aduskett@gmail.com>
Message-ID: <20190927235502.733ae685@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  3 Aug 2019 21:16:28 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> ASGI is a standard for Python asynchronous web apps and servers to
> communicate with each other, and positioned as an asynchronous
> successor to WSGI.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  DEVELOPERS                                 |  1 +
>  package/Config.in                          |  1 +
>  package/python-asgiref/Config.in           | 14 ++++++++++++++
>  package/python-asgiref/python-asgiref.hash |  5 +++++
>  package/python-asgiref/python-asgiref.mk   | 14 ++++++++++++++
>  5 files changed, 35 insertions(+)
>  create mode 100644 package/python-asgiref/Config.in
>  create mode 100644 package/python-asgiref/python-asgiref.hash
>  create mode 100644 package/python-asgiref/python-asgiref.mk

Applied to master, thanks. I applied this patch 05/08 before patch
04/08, because patch 04/08 needs python-asgiref.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
