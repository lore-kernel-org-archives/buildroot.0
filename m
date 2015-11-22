From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 14:11:22 +0100
Subject: [Buildroot] [PATCH] package/python-pydal: bump to version 2.11.3
In-Reply-To: <1448120479-7715-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1448120479-7715-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20151122141122.4f03dc29@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Sat, 21 Nov 2015 16:41:19 +0100, Angelo Compagnucci wrote:
> This patch bumps web2py version to 2.11.3
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/python-web2py/python-web2py.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
> index 2991bb8..02c854d 100644
> --- a/package/python-web2py/python-web2py.mk
> +++ b/package/python-web2py/python-web2py.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PYTHON_WEB2PY_VERSION = R-2.11.2
> +PYTHON_WEB2PY_VERSION = R-2.11.3
>  PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,$(PYTHON_WEB2PY_VERSION))
>  PYTHON_WEB2PY_LICENSE = LGPLv3
>  PYTHON_WEB2PY_LICENSE_FILES = LICENSE

The title of the commit was wrong: it's bumping python-web2py, not
python-pydal. I've fixed that and applied to next.

Also, if you have time, please send a patch adding a hash file to this
package, since github downloads are not assumed to provide stable
tarballs.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
