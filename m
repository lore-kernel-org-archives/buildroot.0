From: Christian Stewart <christian@paral.in>
Date: Wed, 20 Sep 2017 11:51:42 +0100
Subject: [Buildroot] OpenSSH build error against master
Message-ID: <CA+h8R2qCu0MTSeX6AATVhHJOOC3O1T7_DvX=87xXY1da_U6XRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Once again running under Gentoo:

configure: error: No crypto library found!
Try --with-libssl-prefix=PATH
 or --with-libgcrypt-prefix=PATH
 or --with-libmbedtls-prefix=PATH
 or --with-wincng on Windows

This is for libssh2-1.8.0 on upstream/master commit 85f11d.

I have libssl 1.0.2l on my machine.

Best,
Christian
