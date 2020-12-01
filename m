From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Dec 2020 21:42:55 +0100
Subject: [Buildroot] [PATCH] package/python-can: bump to verison 3.3.4
In-Reply-To: <20201108165755.1191036-1-angelo@amarulasolutions.com>
References: <20201108165755.1191036-1-angelo@amarulasolutions.com>
Message-ID: <412ebf02-af93-b8d5-25c3-71c4d7847f38@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/11/2020 17:57, Angelo Compagnucci wrote:
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

 Applied to next, thanks.

 Regards,
 Arnout

> ---
>  package/python-can/python-can.hash | 4 ++--
>  package/python-can/python-can.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
> index ced51d8b75..5330e5899c 100644
> --- a/package/python-can/python-can.hash
> +++ b/package/python-can/python-can.hash
> @@ -1,4 +1,4 @@
> -# sha256 from https://pypi.org/pypi/python-can/json
> -sha256	ecd69cf6b2f0235345ebe607a15325cf1384c85b24ffbe1d68c3754357f87488  python-can-3.3.3.tar.gz
> +# sha256 from https://pypi.org/pypi/python-can
> +sha256	2d3c223b7adc4dd46ce258d4a33b7e0dbb6c339e002faa40ee4a69d5fdce9449  python-can-3.3.4.tar.gz
>  # Locally computed sha256 checksums
>  sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
> diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
> index 158e89f204..1ab813e2c9 100644
> --- a/package/python-can/python-can.mk
> +++ b/package/python-can/python-can.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -PYTHON_CAN_VERSION = 3.3.3
> -PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/b0/fa/8c6eb8988130f256db4c3cf84537c44684dbb3d528d2e1a1d2209eac4d90
> +PYTHON_CAN_VERSION = 3.3.4
> +PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/97/dd/5e5ae96db41ba57dde127e0600c3d324239ed692e167296c5fdb992cbf41
>  PYTHON_CAN_SETUP_TYPE = setuptools
>  PYTHON_CAN_LICENSE = LGPL-3.0
>  PYTHON_CAN_LICENSE_FILES = LICENSE.txt
> 
