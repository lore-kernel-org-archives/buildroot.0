From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Jan 2013 22:44:22 +0100
Subject: [Buildroot] [PATCH] make version update 3.82
In-Reply-To: <1352464803-23068-1-git-send-email-alexander@mezon.ru> (Alexander
 Khryukin's message of "Fri, 9 Nov 2012 16:40:03 +0400")
References: <1352464803-23068-1-git-send-email-alexander@mezon.ru>
Message-ID: <87mwwmc7gp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Khryukin <alexander@mezon.ru> writes:

 Alexander> Signed-off-by: Alexander Khryukin <alexander@mezon.ru>
 Alexander> ---
 Alexander>  package/make/make.mk | 2 +-
 Alexander>  1 file changed, 1 insertion(+), 1 deletion(-)

 Alexander> diff --git a/package/make/make.mk b/package/make/make.mk
 Alexander> index 02b2741..cfb53f1 100644
 Alexander> --- a/package/make/make.mk
 Alexander> +++ b/package/make/make.mk
 Alexander> @@ -3,7 +3,7 @@
 Alexander>  # make
 Alexander>  #
 Alexander>  #############################################################
 Alexander> -MAKE_VERSION:=3.81
 Alexander> +MAKE_VERSION:=3.82

The version bump is fine, but may I ask what you are using make on the
target for? We have deprecated the target development tools packages and
plan on removing them soon.

-- 
Bye, Peter Korsgaard
