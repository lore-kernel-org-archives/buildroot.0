From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 21 Oct 2012 11:20:35 +0200
Subject: [Buildroot] findutils version update 4.5.10
In-Reply-To: <1349964060.28555.6.camel@localhost> (Alexander Khryukin's
 message of "Thu, 11 Oct 2012 18:01:00 +0400")
References: <1349964060.28555.6.camel@localhost>
Message-ID: <87pq4ctc4c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Khryukin <alexander@mezon.ru> writes:

 Alexander> Signed-off-by: Alexander Khryukin <alexander@mezon.ru>
 Alexander> ---
 Alexander> Date: Thu, 11 Oct 2012 14:03:06 +0000
 Alexander> Subject: [PATCH] findutils version update 4.5.10

 Alexander> ---
 Alexander>  package/findutils/findutils.mk | 4 ++--
 Alexander>  1 file changed, 2 insertions(+), 2 deletions(-)

 Alexander> diff --git a/package/findutils/findutils.mk
 Alexander> b/package/findutils/findutils.mk
 Alexander> index 43aef75..ffc7327 100644
 Alexander> --- a/package/findutils/findutils.mk
 Alexander> +++ b/package/findutils/findutils.mk
 Alexander> @@ -4,8 +4,8 @@
 Alexander>  #
 Alexander>  #############################################################
 
 Alexander> -FINDUTILS_VERSION = 4.4.2
 Alexander> -FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
 Alexander> +FINDUTILS_VERSION = 4.5.10
 Alexander> +FINDUTILS_SITE = http://alpha.gnu.org/gnu/findutils

Is that a stable release? Is there any specific reason to use an alpha
version?

-- 
Bye, Peter Korsgaard
