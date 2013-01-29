From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 29 Jan 2013 23:29:00 +0100
Subject: [Buildroot] [PATCH 08/10] liboping: add license information
In-Reply-To: <1359483839-25357-8-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 29 Jan 2013 15:23:57 -0300")
References: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
 <1359483839-25357-8-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a9rrbp3n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/liboping/liboping.mk | 2 ++
 Gustavo>  1 file changed, 2 insertions(+)

 Gustavo> diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
 Gustavo> index e253fbd..d852ef9 100644
 Gustavo> --- a/package/liboping/liboping.mk
 Gustavo> +++ b/package/liboping/liboping.mk
 Gustavo> @@ -9,5 +9,7 @@ LIBOPING_SITE = http://verplant.org/liboping/files
 Gustavo>  LIBOPING_INSTALL_STAGING = YES
 Gustavo>  LIBOPING_DEPENDENCIES = $(if $(BR2_PACKAGE_NCURSES),ncurses)
 Gustavo>  LIBOPING_CONF_OPT = --without-perl-bindings
 Gustavo> +LIBOPING_LICENSE = LGPLv2.1+ GPLv2
 Gustavo> +LIBOPING_LICENSE_FILES = COPYING.LIB

Hmm, I don't see any mention og GPL right away, and only a COPYING file
(no COPYING.LIB)?

-- 
Bye, Peter Korsgaard
