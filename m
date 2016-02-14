From: noreply at cubro.net <noreply@cubro.net>
Date: Sun, 14 Feb 2016 14:40:17 +0100
Subject: [Buildroot] Bug: Nginx SSL Module does not compile with
	BR2_STATIC_LIBS
Message-ID: <56C083C1.3000502@cubro.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To whom it may concern,

Setting BR2_STATIC_LIBS will break the compilation of Nginx with the SSL 
module.

Error message:
./configure: error: SSL modules require the OpenSSL library.
You can either do not enable the modules, or install the OpenSSL library 
into the system, or build the OpenSSL library statically from the source 
with nginx by using --with-openssl=<path> option.

Tested with the latest stable 2015.11.1
