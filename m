From: David Sanchez Herrero <david.krusty@gmail.com>
Date: Tue, 18 Sep 2012 00:35:51 +0200
Subject: [Buildroot] Error on ssh login: "loadkmap: can't open console"
Message-ID: <CAMPeO9xZFoP5fKy5VhvUNaF0C2qB0TJxPnB53mwfd5P5FjKduw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm getting this error after login when connecting to Raspberry using ssh,
with a non root user. This error isn't shown when I login locally with the
same user.
If I run loadkmap manually, I get the same error, but with sudo, the error
doesn't appear:

$ loadkmap < /usr/share/keymaps/es.bmap
loadkmap: can't open console
$ sudo loadkmap < /usr/share/keymaps/es.bmap
Password:
$

Any ideas about the problem??

Thanks in advance, David.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120918/a472dfae/attachment.html>
