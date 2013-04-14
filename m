From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Apr 2013 20:40:29 +0200
Subject: [Buildroot] [PATCH 1/4] radvd: bump to version 1.9.3
In-Reply-To: <1365899021-7675-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 13 Apr 2013 21:23:38 -0300")
References: <1365899021-7675-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ehedot0i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/radvd/radvd.mk | 2 +-
 Gustavo>  1 file changed, 1 insertion(+), 1 deletion(-)

 Gustavo> diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
 Gustavo> index 95bfe07..9d1d683 100644
 Gustavo> --- a/package/radvd/radvd.mk
 Gustavo> +++ b/package/radvd/radvd.mk
 Gustavo> @@ -4,7 +4,7 @@
 Gustavo>  #
 Gustavo>  #############################################################
 
 Gustavo> -RADVD_VERSION = 1.9.2
 Gustavo> +RADVD_VERSION = 1.9.3

Committed all 4, thanks.

It would be good if you could also add license tags while you're at it.

 Gustavo>  RADVD_SITE = http://www.litech.org/radvd/dist
 Gustavo>  RADVD_DEPENDENCIES = host-bison flex libdaemon host-flex host-pkgconf
 Gustavo>  RADVD_AUTORECONF = YES

I believe we can drop AUTORECONF here (should have been done with the
1.9.2 bump). I'll fix it here.

-- 
Bye, Peter Korsgaard
