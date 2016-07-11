From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 11 Jul 2016 16:33:22 +0000 (UTC)
Subject: [Buildroot] Buildroot now requires IPv6?
Message-ID: <nm0hoh$8ce$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The products for which I use buildroot do not have IPv6 support
(that's in the product requirements).  However, it appears that more
recent versions of Buildroot now force you to use a toolchain with
IPv6 support in the C library even if no applications uses IPv6 and
the kernel doesn't support IPV6.

Do I understand this correctly?

-- 
Grant Edwards               grant.b.edwards        Yow! Let's send the
                                  at               Russians defective
                              gmail.com            lifestyle accessories!
