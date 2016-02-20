From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 15:18:06 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/libarchive: add optional
 support for bzip2
In-Reply-To: <1455976435-2614-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455976435-2614-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160220151806.62441ac5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sat, 20 Feb 2016 14:53:54 +0100, Bernd Kuhls wrote:

> configure.ac always checks bz2 support unless --without-bz2lib is used:
> https://github.com/libarchive/libarchive/blob/master/configure.ac#L300
> 
> Therefore we do not need --with-bz2lib.

Still, we prefer to be explicit, and pass --with-<foo> for all
AC_ARG_WITH() options.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
