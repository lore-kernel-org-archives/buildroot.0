From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Tue, 28 Oct 2014 15:04:09 +0100
Subject: [Buildroot] Telnet client (inetutils)
Message-ID: <CABbD_XCzBtvwnoHjpBKU902MY9FQMcUGnbix3MVTP7vRde+cLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout & list,

I think since commit
http://git.buildroot.org/buildroot/commit/?id=560fe85bf7fb81956e80848c8bb28d7a6d00a2a2
there is no
telnet client in Buildroot if the user does not want to use Busybox (which
is my case sometimes).
Do you think adding the inetutils package, which provides a simple telnet,
telnetd, ftp and ftpd and a few more utilities would
be acceptable? It looks far more recent than netkit was (Jan. 2014 was the
latest release).

If so, I would be happy to try to provide a package.

Best regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141028/1ec869c5/attachment.html>
