From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Oct 2018 13:59:34 +0200
Subject: [Buildroot] [PATCH 20/23] python-pyasn1-modules: new package
In-Reply-To: <20180926153505.3411-21-asafka7@gmail.com>
References: <20180926153505.3411-1-asafka7@gmail.com>
 <20180926153505.3411-21-asafka7@gmail.com>
Message-ID: <20181004135934.170a60cb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Sep 2018 18:35:02 +0300, Asaf Kahlon wrote:
> A collection of ASN.1-based protocols modules.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  DEVELOPERS                                         |  1 +
>  package/Config.in                                  |  1 +
>  package/python-pyasn1-modules/Config.in            |  7 +++++++
>  .../python-pyasn1-modules.hash                     |  5 +++++
>  .../python-pyasn1-modules/python-pyasn1-modules.mk | 14 ++++++++++++++
>  5 files changed, 28 insertions(+)
>  create mode 100644 package/python-pyasn1-modules/Config.in
>  create mode 100644 package/python-pyasn1-modules/python-pyasn1-modules.hash
>  create mode 100644 package/python-pyasn1-modules/python-pyasn1-modules.mk

Applied to master with Yegor Reviewed-by, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
