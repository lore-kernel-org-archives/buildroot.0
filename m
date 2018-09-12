From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 23:48:56 +0200
Subject: [Buildroot] [PATCH 1/1] python-fire: new package
In-Reply-To: <20180824191650.4200-1-asafka7@gmail.com>
References: <20180824191650.4200-1-asafka7@gmail.com>
Message-ID: <20180912234856.541bb81b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Aug 2018 22:16:50 +0300, Asaf Kahlon wrote:
> A library for automatically generating command line interfaces.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  DEVELOPERS                           |  1 +
>  package/Config.in                    |  1 +
>  package/python-fire/Config.in        |  8 ++++++++
>  package/python-fire/python-fire.hash |  5 +++++
>  package/python-fire/python-fire.mk   | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/python-fire/Config.in
>  create mode 100644 package/python-fire/python-fire.hash
>  create mode 100644 package/python-fire/python-fire.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
