From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 08:22:59 +0100
Subject: [Buildroot] [PATCH 2/7] Additions necessary to compile
 Crossbar.io
In-Reply-To: <1454289936-10654-3-git-send-email-mc5686@mclink.it>
References: <1454289936-10654-1-git-send-email-mc5686@mclink.it>
 <1454289936-10654-3-git-send-email-mc5686@mclink.it>
Message-ID: <20160201082259.21fb8250@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mauro Condarelli,

On Mon,  1 Feb 2016 02:25:31 +0100, Mauro Condarelli wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                                  | 15 ++++++++++++++
>  package/libffi/libffi.mk                           | 11 +++++++++++
>  package/python-autobahn/Config.in                  |  8 ++++++++
>  package/python-autobahn/python-autobahn.mk         | 15 ++++++++++++++
>  package/python-cffi/python-cffi.mk                 |  2 ++
>  package/python-characteristic/Config.in            |  8 ++++++++
>  .../python-characteristic/python-characteristic.mk | 15 ++++++++++++++
>  package/python-click/Config.in                     |  8 ++++++++
>  package/python-click/python-click.mk               | 15 ++++++++++++++
>  package/python-cryptography/Config.in              | 20 +++++++++++++++++++
>  .../python-cryptography/python-cryptography.hash   |  3 +++
>  package/python-cryptography/python-cryptography.mk | 23 ++++++++++++++++++++++
>  package/python-jinja2/python-jinja2.hash           |  5 +++++
>  package/python-jinja2/python-jinja2.mk             |  2 +-
>  package/python-mistune/Config.in                   |  9 +++++++++
>  package/python-mistune/python-treq.mk              | 15 ++++++++++++++
>  package/python-netaddr/Config.in                   |  8 ++++++++
>  package/python-netaddr/python-netaddr.mk           | 15 ++++++++++++++
>  package/python-pyasn1-modules/Config.in            |  8 ++++++++
>  .../python-pyasn1-modules/python-pyasn1-modules.mk | 15 ++++++++++++++
>  package/python-pycparser/Config.in                 |  6 ++++++
>  package/python-pycparser/python-pycparser.hash     |  4 ++++
>  package/python-pycparser/python-pycparser.mk       | 15 ++++++++++++++
>  package/python-pygments/Config.in                  |  8 ++++++++
>  package/python-pygments/python-pygments.mk         | 15 ++++++++++++++
>  package/python-pyopenssl/Config.in                 | 12 +++++++++++
>  package/python-pyopenssl/python-pyopenssl.hash     |  3 +++
>  package/python-pyopenssl/python-pyopenssl.mk       | 14 +++++++++++++
>  package/python-pytrie/Config.in                    |  8 ++++++++
>  package/python-pytrie/python-pytrie.mk             | 15 ++++++++++++++
>  package/python-service-identity/Config.in          |  8 ++++++++
>  .../python-service-identity.mk                     | 15 ++++++++++++++
>  package/python-shutilwhich/Config.in               |  8 ++++++++
>  package/python-shutilwhich/python-shutilwhich.mk   | 15 ++++++++++++++
>  package/python-treq/Config.in                      | 13 ++++++++++++
>  package/python-treq/python-treq.mk                 | 17 ++++++++++++++++
>  package/python-txaio/Config.in                     |  8 ++++++++
>  package/python-txaio/python-txaio.mk               | 15 ++++++++++++++

This patch needs to be split in one patch per package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
