From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Dec 2011 22:58:55 +0100
Subject: [Buildroot] [PATCH v2 1/1] New package libesmtp : Library for
	sending emails through SMTP.
In-Reply-To: <1323875047-27039-1-git-send-email-sagaert.johan@skynet.be>
 (Sagaert Johan's message of "Wed, 14 Dec 2011 16:04:07 +0100")
References: <1323875047-27039-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <87zkelpoww.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> This is a library for sending email through SMTP.

 Sagaert> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
 Sagaert> ---
 Sagaert>  package/Config.in            |    1 +
 Sagaert>  package/libesmtp/Config.in   |    6 ++++++
 Sagaert>  package/libesmtp/libesmtp.mk |   11 +++++++++++
 Sagaert>  3 files changed, 18 insertions(+), 0 deletions(-)
 Sagaert>  create mode 100644 package/libesmtp/Config.in
 Sagaert>  create mode 100644 package/libesmtp/libesmtp.mk

 Sagaert> diff --git a/package/Config.in b/package/Config.in
 Sagaert> index eb93b1c..c9812af 100644
 Sagaert> --- a/package/Config.in
 Sagaert> +++ b/package/Config.in
 Sagaert> @@ -338,6 +338,7 @@ source "package/libpcap/Config.in"
 Sagaert>  source "package/libosip2/Config.in"
 Sagaert>  source "package/librsync/Config.in"
 Sagaert>  source "package/libsoup/Config.in"
 Sagaert> +source "package/libesmtp/Config.in"

This should be sorted alphabetically. Other than that it looks good,
committed - Thanks.

-- 
Bye, Peter Korsgaard
