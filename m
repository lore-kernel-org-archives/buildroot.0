From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Sep 2012 22:48:43 +0200
Subject: [Buildroot] [PATCH 06/10] grep: bump to version 2.14
In-Reply-To: <1347029337-12494-6-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 7 Sep 2012 11:48:53 -0300")
References: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
 <1347029337-12494-6-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bohe3ot0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/grep/grep.mk |    4 +++-
 Gustavo>  1 files changed, 3 insertions(+), 1 deletions(-)

 Gustavo> diff --git a/package/grep/grep.mk b/package/grep/grep.mk
 Gustavo> index 4ed5fea..4a10fae 100644
 Gustavo> --- a/package/grep/grep.mk
 Gustavo> +++ b/package/grep/grep.mk
 Gustavo> @@ -4,9 +4,11 @@
 Gustavo>  #
 Gustavo>  #############################################################
 
 Gustavo> -GREP_VERSION = 2.13
 Gustavo> +GREP_VERSION = 2.14
 Gustavo>  GREP_SITE = $(BR2_GNU_MIRROR)/grep
 Gustavo>  GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 Gustavo> +GREP_LICENSE = GPLv3

GPLv3+ as well. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
