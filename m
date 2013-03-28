From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 28 Mar 2013 12:51:52 +0100
Subject: [Buildroot] [PATCHv2] fbset: needs host-bison and host-flex
In-Reply-To: <1364471320-12833-1-git-send-email-gustavo@zacarias.com.ar>
References: <1364471320-12833-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAAXf6LU1aoPU4TjZ4bdPkVHHKJPZ28_gDCjfDMf-XQ4WNf478g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 28, 2013 at 12:48 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar>wrote:

> Fixes:
>
> http://autobuild.buildroot.net/results/08d6d70f7c89617c20e727e77e0f6be09974dfc1/
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/fbset/fbset.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
> index b8a8f43..920ccc8 100644
> --- a/package/fbset/fbset.mk
> +++ b/package/fbset/fbset.mk
> @@ -7,6 +7,7 @@
>  FBSET_VERSION = 2.1
>  FBSET_SOURCE = fbset-$(FBSET_VERSION).tar.gz
>  FBSET_SITE = http://users.telenet.be/geertu/Linux/fbdev
> +FBSET_DEPENDENCIES = host-bison host-flex
>  FBSET_LICENSE = GPLv2
>
>  # Make sure full fbset wins over busybox fbset
>

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130328/fe3d1921/attachment-0001.html>
