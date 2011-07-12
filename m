From: Daniel Mack <zonque@gmail.com>
Date: Wed, 13 Jul 2011 01:05:10 +0200
Subject: [Buildroot] Depending on uClibc configuration variables
Message-ID: <CACTFLAORWLAkCfzgfMxu_75txKhFiuxNfF4t81nQ5646BMngWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is there a clever way to depend on variables set in the uClibc
configuration directly in package Config.in files? Something like
UCLIBC_HAS_EPOLL for example?


Daniel
