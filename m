From: LWATCDR <lwatcdr@gmail.com>
Date: Fri, 2 Oct 2020 09:31:03 -0400
Subject: [Buildroot] Compiled in kernel drivers.
Message-ID: <CAFHUVmQYxsnrxRnHgXntxxEt_jJTfqd4TKb14mnzMzinoB-6Aw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have written a driver that must be compiled into the kernel. It can not
work as a loadable. It is in my br_external and I have changed the make
file to make it build in the kernel. vs a loadable. The problem is that it
just does not seem to work in build root. Does anyone know how to make it
work? I can get it to build and work as a loadable but only if I remove
some needed functionality so it must be compiled into the kernel. It works
just fine if I copy it into the drivers folder of the kernel and do a
traditional kconfig kernel build. also does anyone know how to search the
mailing list? I did not see a search. .
Thank you.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201002/c0678f2e/attachment.html>
