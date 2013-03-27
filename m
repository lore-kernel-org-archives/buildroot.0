From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Mar 2013 11:53:56 -0300
Subject: [Buildroot] [PATCH 5/5] Update libarchive to 3.0.4
In-Reply-To: <1364308865-18786-1-git-send-email-arved@arved.at>
References: <1364308865-18786-1-git-send-email-arved@arved.at>
Message-ID: <51530804.7010507@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/26/2013 11:41 AM, arved at arved.at wrote:

> -LIBARCHIVE_VERSION = 2.8.5
> -LIBARCHIVE_SITE = http://libarchive.googlecode.com/files/
> +LIBARCHIVE_VERSION = 3.0.4
> +LIBARCHIVE_SITE = https://github.com/downloads/libarchive/libarchive
>  LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.gz
>  LIBARCHIVE_INSTALL_STAGING = YES

Can you resend changing the homepage in Config.in to the new site?
And also use the non-https URL since it's available? For example
http://www.libarchive.org/downloads/libarchive-3.1.2.tar.gz
Thanks!
