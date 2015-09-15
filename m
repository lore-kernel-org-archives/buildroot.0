From: Ran Shalit <ranshalit@gmail.com>
Date: Tue, 15 Sep 2015 23:55:20 +0300
Subject: [Buildroot] LD_LIBRARY_PATH variable
Message-ID: <CAJ2oMh+nrOjF8VK0FmCj7KuL=29rF_vtqEO7A+99OTh5Ov00RQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have some strange issue, in which I have to export LD_LIBRARY_PATH
(.../output/host/usr/lib), otherwise the build fails on not ""cannot
open shared object file: No such file or directory.... " during build
(with the make command without any arguments).
The strange thing is that I done it several times before without
specifying the export command, so I really don't understand what
happened in my host environment that requires this additional command.

But now I get a new error during build:
fakeroot: preload library `libfakeroot.so' not found, aborting.

On checking I do see that it exist in .../output/host/usr/lib
Is there any idea what's wrong ?

Regards,
Ran
