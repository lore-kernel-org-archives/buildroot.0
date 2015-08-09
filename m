From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 09 Aug 2015 21:57:40 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/jsoncpp: Broken on musl
References: <1439121001-14787-1-git-send-email-bernd.kuhls@t-online.de>
 <1439146794.12501.25.camel@embedded.rocks>
Message-ID: <kunk9cxek9.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

Am Sun, 09 Aug 2015 20:59:54 +0200 schrieb J?rg Krause:

> After a short investigation [1] I realized this error only applies for
> x86 targets.
> 
> [1] https://gcc.gnu.org/ml/gcc-patches/2015-04/msg01084.html

v1 of my patch tried to fix it that way but it does not work for external 
toolchains: http://patchwork.ozlabs.org/patch/460337/

Regards, Bernd
