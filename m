From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 06 May 2013 13:52:35 +0200
Subject: [Buildroot] [PATCH] python: remove smtpd.py
In-Reply-To: <1367840923-19121-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 6 May 2013 08:48:43 -0300")
References: <1367840923-19121-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87txmgiav0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> It's mostly sample code, normally not used, and has a bad shebang line.
 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/python/python.mk | 11 +++++++----
 Gustavo>  1 file changed, 7 insertions(+), 4 deletions(-)

 Gustavo> diff --git a/package/python/python.mk b/package/python/python.mk
 Gustavo> index 4876dd8..265b7d0 100644
 Gustavo> --- a/package/python/python.mk
 Gustavo> +++ b/package/python/python.mk
 Gustavo> @@ -108,10 +108,6 @@ else
 Gustavo>  PYTHON_CONF_OPT += --disable-zlib
 Gustavo>  endif
 
 Gustavo> -ifeq ($(BR2_PACKAGE_PYTHON_HASHLIB),y)
 Gustavo> -PYTHON_DEPENDENCIES += openssl
 Gustavo> -endif
 Gustavo> -

I guess this shouldn't get dropped?

-- 
Bye, Peter Korsgaard
