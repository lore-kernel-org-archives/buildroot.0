From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 19:28:12 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/python-periphery: new package
In-Reply-To: <1561055893-22140-1-git-send-email-pjtexier@koncepto.io>
References: <1561055893-22140-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190622192812.3abffc71@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 Jun 2019 20:38:13 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
> Changes v1 -> v2
>  - remove 'v' prefix in PYTHON_PERIPHERY_VERSION
>  
>  Scanpy was not used because the archive in pythonhosted
>  does not contain the license file.
>  
>  With the github repo : make python-periphery-legal-info 
>    >>> python-periphery 1.1.1 Collecting legal info  
>    LICENSE: OK (sha256: db1bea825e728d8bcdf6c220d79c74370a9fcb63a4f9153c2cece2b63e177aa4)
>  
>  DEVELOPERS                                     |  1 +
>  package/Config.in                              |  1 +
>  package/python-periphery/Config.in             |  7 +++++++
>  package/python-periphery/python-periphery.hash |  3 +++
>  package/python-periphery/python-periphery.mk   | 13 +++++++++++++
>  5 files changed, 25 insertions(+)
>  create mode 100644 package/python-periphery/Config.in
>  create mode 100644 package/python-periphery/python-periphery.hash
>  create mode 100644 package/python-periphery/python-periphery.mk

Applied to master, thanks. It would be good to notify upstream that the
LICENSE file is missing in the "official" tarball available from PyPi.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
