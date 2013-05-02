From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 May 2013 23:28:03 +0200
Subject: [Buildroot] [PATCH] libgcrypt: bump to version 1.5.2
In-Reply-To: <1367338913-18810-1-git-send-email-fenixk19@mail.ru> (Alexander
 Varnin's message of "Tue, 30 Apr 2013 20:21:53 +0400")
References: <1367338913-18810-1-git-send-email-fenixk19@mail.ru>
Message-ID: <87r4hpysv0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Varnin <fenixk19@mail.ru> writes:

 Alexander> Signed-off-by: Alexander Varnin <fenixk19@mail.ru>
 Alexander> ---
 Alexander>  package/libgcrypt/libgcrypt.mk |    2 +-
 Alexander>  1 files changed, 1 insertions(+), 1 deletions(-)

 Alexander> diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
 Alexander> index b0a8a73..7870913 100644
 Alexander> --- a/package/libgcrypt/libgcrypt.mk
 Alexander> +++ b/package/libgcrypt/libgcrypt.mk
 Alexander> @@ -4,7 +4,7 @@
 Alexander>  #
 Alexander>  #############################################################
 
 Alexander> -LIBGCRYPT_VERSION = 1.5.0
 Alexander> +LIBGCRYPT_VERSION = 1.5.2

Thanks, but we've already done so in git by Gustavoz on the 23rd.

-- 
Bye, Peter Korsgaard
