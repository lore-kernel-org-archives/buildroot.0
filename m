From: martin krastev <blu.dark@gmail.com>
Date: Sun, 10 Feb 2013 18:09:15 +0200
Subject: [Buildroot] non-standard architecture targets
Message-ID: <CAKPuMhOrKZwAp5FZgvBO2M5dfvrFnCjBchwAfBn+_tu_XiwB2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to get buildroot (buildroot-2012.11.1) to produce a cross
toolchain (x86_64 -> powerpc) of a non-standard target triplet (if
it's still called that way). I am currently getting
"powerpc-buildroot-linux-uclibc", and I would like to extend that to
"powerpc-buildroot-linux-uclibc-paired" or
"powerpc-buildroot-linux-paired-uclibc" - generally anything following
the powerpc*-*-linux*paired* pattern.

What is the natural way to set this up in buildroot?


Thank you for your time, and best regards,

Martin
