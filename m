From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 10 Jan 2021 21:57:45 +0800
Subject: [Buildroot] random segmentation fault during built
Message-ID: <CAEUhbmUnHYTOhirctT9EVphsys9PPwbvM5hkBKP7sVabnv1zmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I see a random segmentation fault during the build of buildroot. For example,

Makefile:13408: recipe for target 'install-pylibmountexecPYTHON' failed
make[4]: *** [install-pylibmountexecPYTHON] Segmentation fault (core dumped)
make[4]: *** Waiting for unfinished jobs....

Type "make" for the 2nd time with nothing changed, or rarely a 3rd
time, get a PASS build.

This was observed by builds on Ubuntu 16.04 and Ubuntu 20.04 hosts.
Any ideas of what could be wrong?

Regards,
Bin
