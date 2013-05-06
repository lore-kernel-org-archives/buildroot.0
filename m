From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 06 May 2013 08:56:04 -0300
Subject: [Buildroot] [PATCH] python: remove smtpd.py
In-Reply-To: <87txmgiav0.fsf@dell.be.48ers.dk>
References: <1367840923-19121-1-git-send-email-gustavo@zacarias.com.ar>
 <87txmgiav0.fsf@dell.be.48ers.dk>
Message-ID: <51879A54.7030906@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/06/2013 08:52 AM, Peter Korsgaard wrote:

>  Gustavo> -ifeq ($(BR2_PACKAGE_PYTHON_HASHLIB),y)
>  Gustavo> -PYTHON_DEPENDENCIES += openssl
>  Gustavo> -endif
>  Gustavo> -
> 
> I guess this shouldn't get dropped?

Rushy patch, sent v2.
Regards.
