From: Assaf Inbal <shmuelzon@gmail.com>
Date: Thu, 3 Oct 2013 08:32:53 +0200
Subject: [Buildroot] Using external toolchain with a different uclibc
Message-ID: <CADwac6Dq2qJinDQ8K8xfr6WuhYEE0JH5nzM2AVRoPufFyfEHfw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey all,

I'm in need of compiling buildroot for a platform for which I was
given a toolchain (gcc + uclibc) and also a different version of
uclibc (compiled + headers) that should be used.

If I use this toolchain (with its embedded uclibc) everything works as
expected, but I wasn't able to use the external uclibc.
I've tried passing various flags to gcc (that are incorporated in the
ext-toolchain-wrapper) including -nostdlib -nostdinc and specifying
the exact directories (with -I and -L) where to find the libraries.
None of these changes worked.

How could I go by configuring buildroot to use a uclibc that's
external to the toolchain?

Thanks in advance,
Assaf
