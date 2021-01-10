From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 10 Jan 2021 17:04:05 +0100
Subject: [Buildroot] random segmentation fault during built
In-Reply-To: <CAEUhbmUnHYTOhirctT9EVphsys9PPwbvM5hkBKP7sVabnv1zmg@mail.gmail.com>
References: <CAEUhbmUnHYTOhirctT9EVphsys9PPwbvM5hkBKP7sVabnv1zmg@mail.gmail.com>
Message-ID: <20210110170405.29cf9095@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bin,

On Sun, 10 Jan 2021 21:57:45 +0800, Bin Meng <bmeng.cn@gmail.com> wrote:

> Hi,
>
> I see a random segmentation fault during the build of buildroot. For example,
>
> Makefile:13408: recipe for target 'install-pylibmountexecPYTHON' failed
> make[4]: *** [install-pylibmountexecPYTHON] Segmentation fault (core dumped)
> make[4]: *** Waiting for unfinished jobs....
>
> Type "make" for the 2nd time with nothing changed, or rarely a 3rd
> time, get a PASS build.
>
> This was observed by builds on Ubuntu 16.04 and Ubuntu 20.04 hosts.
> Any ideas of what could be wrong?

In case the errors are at random packages/locations (and succeed on iteration)
check your hardware and/or memory, see e.g. [1]...

Early versions of the AMD Ryzen CPU had heavy-load segfault bug, see [2]...

Regards,
Peter

[1] https://tldp.org/FAQ/sig11/html/index.html
[2] https://techreport.com/news/32459/amd-ships-revised-ryzen-cpus-with-a-compile-bug-fix/

>
> Regards,
> Bin
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
