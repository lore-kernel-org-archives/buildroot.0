From: Jeff Sadowski <jeff.sadowski@gmail.com>
Date: Tue, 8 Feb 2011 15:46:26 -0700
Subject: [Buildroot] Build an initrd with curlftpfs
Message-ID: <AANLkTimoh+kkh1S7M_WrxJQCR6y2rBxhdZDik4xF71SW@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I want to build an initrd with curlftpfs so that I can mount an ftp
share as root.

Is this possible with buildroot?

I see that it has libcurl and libfuse.
Has anyone on here done such a thing?
Is there any reason why this is a bad idea?

I am using mintlinux and would like to use the stock kernel and build
an initrd that has curlftpfs and a simple variable that I pass via the
pxelinux config file to point to the ftp server. That way I can easily
set it up on any windows network.
