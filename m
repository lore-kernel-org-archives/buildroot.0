From: Dinesh Guleria <din.gulu.er@gmail.com>
Date: Sun, 6 Sep 2015 17:27:04 +0530
Subject: [Buildroot] Buildroot kconfig option
In-Reply-To: <20150906134901.66a22482@free-electrons.com>
References: <CAKpDV8vL7GHk3cQ5Jk5o4G654KfQpQAfopsrA0Fotvu+vsaKMw@mail.gmail.com>
 <20150906091033.GC2213@tarshish>
 <CAKpDV8sMNQH6hMaSSrgAeJM0GhAN0DiSKFn7dbkMagcdtMb9AQ@mail.gmail.com>
 <20150906134901.66a22482@free-electrons.com>
Message-ID: <CAKpDV8tN70nP3m_-JiSsh=3FPsywxqLv3aPk0ZAE0Z58F+jVSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks.
On 6 Sep 2015 17:19, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
wrote:

> Dear Dinesh Guleria,
>
> On Sun, 6 Sep 2015 17:07:42 +0530, Dinesh Guleria wrote:
>
> > One more thing ,
> >
> > BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG
> >
> > This is environmental variable ?
> >
> > If yes then , Do i have to export so many variables manually or buildroot
> > support some file where i can mention these variables ?
>
> All BR2_* variables are kconfig options, they are defined by running
> "make menuconfig".
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150906/eceb4b92/attachment.html>
