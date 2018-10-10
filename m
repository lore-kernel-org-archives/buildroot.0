From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 14:28:05 +0200
Subject: [Buildroot] [PATCH 1/4] python-pycryptodomex: new package
In-Reply-To: <20180922193631.14369-1-asafka7@gmail.com>
References: <20180922193631.14369-1-asafka7@gmail.com>
Message-ID: <20181010142805.147421e8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Sep 2018 22:36:28 +0300, Asaf Kahlon wrote:
> Cryptographic library for Python
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  DEVELOPERS                                         |  1 +
>  package/Config.in                                  |  1 +
>  package/python-pycryptodomex/Config.in             |  6 ++++++
>  .../python-pycryptodomex/python-pycryptodomex.hash |  5 +++++
>  .../python-pycryptodomex/python-pycryptodomex.mk   | 14 ++++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/python-pycryptodomex/Config.in
>  create mode 100644 package/python-pycryptodomex/python-pycryptodomex.hash
>  create mode 100644 package/python-pycryptodomex/python-pycryptodomex.mk

Applied to master with the license information fixed, as per the
discussion with Yann.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
