From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 21 Jan 2013 23:54:18 +0100
Subject: [Buildroot] [PATCH 10/10] lame: add license information
In-Reply-To: <1358803790-30245-10-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 21 Jan 2013 18:29:50 -0300")
References: <1358803790-30245-1-git-send-email-gustavo@zacarias.com.ar>
 <1358803790-30245-10-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ehhe6tb9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/multimedia/lame/lame.mk | 2 ++
 Gustavo>  1 file changed, 2 insertions(+)

 Gustavo> diff --git a/package/multimedia/lame/lame.mk b/package/multimedia/lame/lame.mk
 Gustavo> index a251f02..4f6b8fd 100644
 Gustavo> --- a/package/multimedia/lame/lame.mk
 Gustavo> +++ b/package/multimedia/lame/lame.mk
 Gustavo> @@ -12,6 +12,8 @@ LAME_DEPENDENCIES = host-pkgconf
 Gustavo>  LAME_INSTALL_STAGING = YES
 Gustavo>  LAME_CONF_ENV = GTK_CONFIG=/bin/false
 Gustavo>  LAME_CONF_OPT = --enable-dynamic-frontends
 Gustavo> +LAME_LICENSE = LGPLv2

It is LGPLv2+:

grep -rls 'later version' *|wc -l
124

Committed with that change, thanks.

-- 
Bye, Peter Korsgaard
