From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Thu, 6 Sep 2012 08:59:16 -0400
Subject: [Buildroot] Autobuild and linux-pam failing to compile
Message-ID: <CADiAo4KUj5s7UO8yZf5OcbY3VsaekJWNpjxSmpd8r_qf1MMJKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I looked into several other autobuild failures on linux-pam (arches
other than x686): it looks like all of them use external toolchains,
and all fail on ndbm linking.

When using an external toolchain, is it possible to force a specific
feature from within buildroot config?

Also, whoever configured those toolchains, can you let me know whether
they include ndbm at all?

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
