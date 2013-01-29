From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 29 Jan 2013 23:20:36 +0100
Subject: [Buildroot] [PATCH 02/10] dialog: add license information
In-Reply-To: <1359483839-25357-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 29 Jan 2013 15:23:51 -0300")
References: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
 <1359483839-25357-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87zjzrbphn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/dialog/dialog.mk | 2 ++
 Gustavo>  1 file changed, 2 insertions(+)

 Gustavo> diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
 Gustavo> index 8d87b77..bac788b 100644
 Gustavo> --- a/package/dialog/dialog.mk
 Gustavo> +++ b/package/dialog/dialog.mk
 Gustavo> @@ -10,6 +10,8 @@ DIALOG_SITE = ftp://invisible-island.net/dialog
 Gustavo>  DIALOG_CONF_OPT = --with-ncurses
 Gustavo>  DIALOG_CONF_ENV = ac_cv_path_NCURSES_CONFIG=true LIBS=-lncurses
 Gustavo>  DIALOG_DEPENDENCIES = ncurses
 Gustavo> +DIALOG_LICENSE = LGPLv2.1+

grep -rls 'later version' *
CHANGES
config.guess
config.sub
COPYING
progressbox.c
samples/copifuncs/copi.funcs
samples/copifuncs/admin.funcs
samples/copifuncs/common.funcs
samples/copismall

None of the source files mention anything else than LGPLv2.1, so I will
drop the +

Committed with that change, thanks.

-- 
Bye, Peter Korsgaard
