From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Sep 2012 22:39:28 +0200
Subject: [Buildroot] [PATCH 02/10] less: bump to version 451
In-Reply-To: <1347029337-12494-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 7 Sep 2012 11:48:49 -0300")
References: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
 <1347029337-12494-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k3w32anz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/less/less.mk |    4 +++-
 Gustavo>  1 files changed, 3 insertions(+), 1 deletions(-)

 Gustavo> diff --git a/package/less/less.mk b/package/less/less.mk
 Gustavo> index c0ecf20..8f14016 100644
 Gustavo> --- a/package/less/less.mk
 Gustavo> +++ b/package/less/less.mk
 Gustavo> @@ -4,8 +4,10 @@
 Gustavo>  #
 Gustavo>  #############################################################
 
 Gustavo> -LESS_VERSION = 444
 Gustavo> +LESS_VERSION = 451
 Gustavo>  LESS_SITE = http://www.greenwoodsoftware.com/less
 Gustavo> +LESS_LICENSE = GPLv3

The README contains the 'or at your option any later version' text, so
this should be GPLv3+

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
