From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Nov 2018 19:20:35 +0100
Subject: [Buildroot] [PATCH 1/1] python-django: select
 BR2_PACKAGE_PYTHON_SETUPTOOLS
In-Reply-To: <20181102085341.29421-2-asafka7@gmail.com>
References: <20181102085341.29421-1-asafka7@gmail.com>
 <20181102085341.29421-2-asafka7@gmail.com>
Message-ID: <20181102192035.51476128@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Nov 2018 10:53:40 +0200, Asaf Kahlon wrote:
> The django-admin cli tool is loaded as entry point with
> pkg_resources, which is included in setuptools.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-django/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
