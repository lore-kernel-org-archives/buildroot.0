From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Sep 2012 22:52:55 +0200
Subject: [Buildroot] [PATCH 07/10] bison: bump to version 2.6.2
In-Reply-To: <1347029337-12494-7-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 7 Sep 2012 11:48:54 -0300")
References: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
 <1347029337-12494-7-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877gs23om0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/bison/bison.mk |    9 +++++----
 Gustavo>  1 files changed, 5 insertions(+), 4 deletions(-)

 Gustavo> diff --git a/package/bison/bison.mk b/package/bison/bison.mk
 Gustavo> index d0c9077..ab61ca4 100644
 Gustavo> --- a/package/bison/bison.mk
 Gustavo> +++ b/package/bison/bison.mk
 Gustavo> @@ -4,11 +4,12 @@
 Gustavo>  #
 Gustavo>  #############################################################
 
 Gustavo> -BISON_VERSION = 2.5.1
 Gustavo> +BISON_VERSION = 2.6.2
 Gustavo>  BISON_SITE = $(BR2_GNU_MIRROR)/bison
 Gustavo> -
 Gustavo> -BISON_CONF_ENV += ac_cv_path_M4=/usr/bin/m4
 Gustavo> -BISON_DEPENDENCIES += m4
 Gustavo> +BISON_LICENSE = GPLv3

GPLv3+. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
