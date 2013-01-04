From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Jan 2013 21:46:16 +0100
Subject: [Buildroot] [PATCH] libnl: bump to version 3.2.17
In-Reply-To: <1357332135-3087-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 4 Jan 2013 17:42:15 -0300")
References: <1357332135-3087-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87hamwn0br.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/libnl/libnl.mk |    2 +-
 Gustavo>  1 files changed, 1 insertions(+), 1 deletions(-)

 Gustavo> diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
 Gustavo> index 9bf680e..12494f4 100644
 Gustavo> --- a/package/libnl/libnl.mk
 Gustavo> +++ b/package/libnl/libnl.mk
 Gustavo> @@ -4,7 +4,7 @@
 Gustavo>  #
 Gustavo>  #############################################################
 
 Gustavo> -LIBNL_VERSION = 3.2.16
 Gustavo> +LIBNL_VERSION = 3.2.17

Committed, thanks.

Could you have a look at http://patchwork.ozlabs.org/patch/208318/ ?

-- 
Bye, Peter Korsgaard
