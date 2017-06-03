From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 03 Jun 2017 08:17:35 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/gettext: update wint_t.m4
	from gnulib
References: <20170525215647.10315-1-bernd.kuhls@t-online.de>
 <20170528161257.4840e1c9@free-electrons.com>
 <c79c6866-3c43-6764-0725-7aaa32a48e91@gmail.com>
Message-ID: <vs0a0exspr.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 02 Jun 2017 23:00:34 +0200 schrieb Romain Naour:

> This patch modify gettext-runtime/m4/wint_t.m4 without using autoreconf:
> 
> GETTEXT_AUTORECONF = YES
> 
> See
> http://autobuild.buildroot.net/results/bd1/
bd186ed437fc23cd4fac92f61bde32f9d530c127/build-end.log

Hi,

yes, I saw the build errors, but I can not reproduce them on my Debian 
stretch system.

Regards, Bernd
