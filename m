From: PHilip RUshik <prushik@gmail.com>
Date: Sun, 4 Mar 2012 17:03:58 +0900
Subject: [Buildroot] Buildroot shared uclibc native compiler only links
	statically
Message-ID: <CAGmOteOykAc56k3F1w9Km+6FJ5wzM9WKTvyGWSxRCb7yZv2cew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
If I build a buildroot system with uClibc as a shared library and with a
native compiler, the resulting native compiler works great most of the
time, but it always links with the static libc.a instead of the shared
library. Why does this happen, anybody know how to fix that?

Thanks

--PHil
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120304/9ac1e6f0/attachment.html>
