From: manu f <e.fiancette@gmail.com>
Date: Fri, 22 Jan 2021 23:32:23 +0100
Subject: [Buildroot] No rule to make target 'host-python !!
In-Reply-To: <CAGshWo02DNPmGa_Nj7aBjf5TrQgVz2ePTP8EkABRfGFSYBsU0A@mail.gmail.com>
References: <CAGshWo02DNPmGa_Nj7aBjf5TrQgVz2ePTP8EkABRfGFSYBsU0A@mail.gmail.com>
Message-ID: <CAGshWo2t3-VKvyAE228zWKMM0TWi-7ca3PpdDT-NLnXUrR7nCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

and I have no output/build/libevdev-1.8.0 directory !

Le ven. 22 janv. 2021 ? 23:21, manu f <e.fiancette@gmail.com> a ?crit :

> Hello all
>
> I got this error and dont know what to do with that !
>
> make[1]: *** No rule to make target 'host-python', needed by
> '/home/user/cleta_buildroot/output/build/libevdev-1.8.0/.stamp_configured'.
> Stop.
> make: *** [Makefile:84: _all] Error 2
> make: Leaving directory '/home/user/cleta_buildroot/buildroot'
> user at LinuxDev:~/cleta_buildroot$
>
>
> I already compiled with success bet I add some packages and got this.
> I try to remove my change but got this error again... strange
> Could I have a guidance to find from where problem come ?
>
> (I compile the 2020.02.8 buildroot version for a specific imx6 board with
> buildroot toolchain.)
>
>
>
>
>
>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210122/e63685be/attachment.html>
