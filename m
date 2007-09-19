From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 19 Sep 2007 06:28:42 +0200
Subject: [Buildroot] OLSR in buildroot - patch
In-Reply-To: <46F061BB.1070604@gmail.com>
References: <46F061BB.1070604@gmail.com>
Message-ID: <1190176122.4516.51.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2007-09-18 klockan 20:39 -0300 skrev Rex Luscus:
> this is a possible patch to discuss

You need to have an OLSR entry for "package/Config.in" 
There is no way you can configure buildroot to build without this.

Have you tested to build this?
Have you tested this on any hardware?


> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
-- 
Best Regards,
Ulf Samuelsson          mail:   ulf at atmel.com
Atmel Nordic AB
Box 2033, 174 52 Sundbyberg
Kavalleriv?gen 24, 174 58 Sundbyberg
Sweden
Tel:    +46 8 441 54 22 GSM:    +46 706 224457
