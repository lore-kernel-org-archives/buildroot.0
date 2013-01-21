From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 21 Jan 2013 23:51:59 +0100
Subject: [Buildroot] [PATCH 08/10] libao: add license information
In-Reply-To: <1358803790-30245-8-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 21 Jan 2013 18:29:48 -0300")
References: <1358803790-30245-1-git-send-email-gustavo@zacarias.com.ar>
 <1358803790-30245-8-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87mww26tf4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/libao/libao.mk | 2 ++
 Gustavo>  1 file changed, 2 insertions(+)

 Gustavo> diff --git a/package/libao/libao.mk b/package/libao/libao.mk
 Gustavo> index aee85a9..9e7ef05 100644
 Gustavo> --- a/package/libao/libao.mk
 Gustavo> +++ b/package/libao/libao.mk
 Gustavo> @@ -8,6 +8,8 @@ LIBAO_VERSION = 1.1.0
 Gustavo>  LIBAO_SITE = http://downloads.xiph.org/releases/ao
 Gustavo>  LIBAO_DEPENDENCIES = host-pkgconf
 Gustavo>  LIBAO_INSTALL_STAGING = YES
 Gustavo> +LIBAO_LICENSE = GPLv2

It is GPLv2+:

grep -rls 'later version' *|wc -l
34

Committed with that change, thanks.

-- 
Bye, Peter Korsgaard
