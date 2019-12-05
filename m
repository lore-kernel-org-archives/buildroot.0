From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 23:14:45 +0100
Subject: [Buildroot] [PATCH 1/2] package/python-django: bump to version
 3.0
In-Reply-To: <20191204200629.686191-1-aduskett@gmail.com>
References: <20191204200629.686191-1-aduskett@gmail.com>
Message-ID: <20191205231445.69b72e81@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Dec 2019 12:06:28 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <aduskett@greenlots.com>
> 
> Other changes:
>   - Select BR2_PACKAGE_PYTHON_ASGIREF as a new runtime dependency.
>   - Select BR2_PACKAGE_PYTHON_SQLPARSE as a new runtime dependency.
> 
> Signed-off-by: Adam Duskett <aduskett@greenlots.com>
> ---
>  package/python-django/Config.in          | 3 +++
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 4 ++--
>  3 files changed, 7 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
