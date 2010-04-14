From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Apr 2010 10:00:23 +0200
Subject: [Buildroot] [PATCH 36/41] libgtk2: force to compile png loader
	in gdk-pixbuf
In-Reply-To: <1271199974-30434-37-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Wed, 14 Apr 2010 01:06:09 +0200")
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
	<1271199974-30434-37-git-send-email-llandwerlin@gmail.com>
Message-ID: <87mxx6h3ag.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> ---
 llandwerlin>  package/libgtk2/libgtk2.mk |    1 +
 llandwerlin>  1 files changed, 1 insertions(+), 0 deletions(-)

 llandwerlin> diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
 llandwerlin> index 1e732d0..f041ce2 100644
 llandwerlin> --- a/package/libgtk2/libgtk2.mk
 llandwerlin> +++ b/package/libgtk2/libgtk2.mk
 llandwerlin> @@ -133,6 +133,7 @@ HOST_LIBGTK2_CONF_OPT = \
 llandwerlin>  		--disable-glibtest \
 llandwerlin>  		--without-libtiff \
 llandwerlin>  		--without-libjpeg \
 llandwerlin> +		--with-included-loaders=png \

Only for the host? Why?

-- 
Bye, Peter Korsgaard
