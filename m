From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Jan 2019 11:31:29 +0100
Subject: [Buildroot] [PATCH 1/3] package/python3-setuptools: new package
In-Reply-To: <20181228170132.13049-2-thomas.petazzoni@bootlin.com>
References: <20181228170132.13049-1-thomas.petazzoni@bootlin.com>
 <20181228170132.13049-2-thomas.petazzoni@bootlin.com>
Message-ID: <20190101113129.48b91ab5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Dec 2018 18:01:29 +0100, Thomas Petazzoni wrote:
> This new package allows to install the host version of setuptools for
> python3, regardless of what the default Python version is. It will be
> used by the python-package infrastructure to make sure that host
> Python packages that need python3 and setuptools have setuptools
> installed for Python 3.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .../0001-add-executable.patch                 | 72 +++++++++++++++++++
>  .../python3-setuptools.hash                   |  1 +
>  .../python3-setuptools/python3-setuptools.mk  | 24 +++++++
>  3 files changed, 97 insertions(+)
>  create mode 100644 package/python3-setuptools/0001-add-executable.patch
>  create mode 120000 package/python3-setuptools/python3-setuptools.hash
>  create mode 100644 package/python3-setuptools/python3-setuptools.mk

Applied to master after changing the duplicated patch by a symlink to
the same patch in package/python-setuptools/, as suggested by Asaf.
Thanks Asaf and Yegor for the review!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
