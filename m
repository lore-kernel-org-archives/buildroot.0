From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Sat, 20 Aug 2016 13:10:07 -0400
Subject: [Buildroot] compiler plugins & compiling the kernel
Message-ID: <CAK7rcp_m+9YC6gJ0xyarD217F4wyjwjg9QSdBLzVgPJ9QLrm7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,


I've noticed that when the kernel is built, it appears to always be
built with the host compiler, and not the buildroot specified cross
compiler. Why is that?

In addition, for some pax related options, it requires gcc plugins for
the version being used. That means that I would have to have plugin
support for my host, correct? I don't believe that there is a way to
enable plugin support for the buildroot toolchain or for crosstool. At
least, when I looked and searched I didn't see any option that
mentioned that. I just want to make sure that I have it correct in
that my host compiler is being used to build the kernel.
