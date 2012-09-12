From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Sep 2012 23:26:48 +0200
Subject: [Buildroot] [PATCH 1/3] hiawatha: bump to version 8.5
In-Reply-To: <1347457916-23684-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 12 Sep 2012 10:51:54 -0300")
References: <1347457916-23684-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87392nszjb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---

 Gustavo> --- a/package/hiawatha/hiawatha.mk
 Gustavo> +++ b/package/hiawatha/hiawatha.mk
 Gustavo> @@ -1,5 +1,7 @@
 Gustavo> -HIAWATHA_VERSION = 8.4
 Gustavo> +HIAWATHA_VERSION = 8.5
 Gustavo>  HIAWATHA_SITE = http://www.hiawatha-webserver.org/files/
 Gustavo> +HIAWATHA_LICENSE = GPLv2+

As far as I can see it is explictly GPLv2. Searching for 'at your
option' only gives hits in the bundled polarssl files, and the webpage
also says GPLv2:

http://www.hiawatha-webserver.org/download

So I've dropped the + and committed, thanks.

-- 
Bye, Peter Korsgaard
