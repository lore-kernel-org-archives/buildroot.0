From: Belisko Marek <marek.belisko@gmail.com>
Date: Fri, 16 Apr 2010 09:14:41 +0200
Subject: [Buildroot] transmission 1.74 fails to build
Message-ID: <y2pe7c6a05e1004160014vf65ef3b9z1ade66ebe4bab63a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

during playing with transmission package get following error:

checking pkg-config is at least version 0.9.0... ./configure: line
17710: /home/open-nandra/projects/buildroot/output/host/usr/bin/pkg-config:
No such file or directory
no
checking for OPENSSL... checking for OpenSSL... /usr
checking for LIBCURL... configure: error: in
`/home/open-nandra/projects/buildroot/output/build/transmission-1.74':
configure: error: The pkg-config script could not be found or is too
old.  Make sure it
is in your PATH or set the PKG_CONFIG environment variable to the full
path to pkg-config.

Alternatively, you may set the environment variables LIBCURL_CFLAGS
and LIBCURL_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

Toolachain is comiled by buildroot. Should I select another option in
toolchain compilation
to compile pkg-config?

Thanks in advance,

Marek
