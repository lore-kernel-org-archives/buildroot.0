From: Dinesh Guleria <din.gulu.er@gmail.com>
Date: Sun, 6 Sep 2015 17:07:42 +0530
Subject: [Buildroot] Buildroot kconfig option
In-Reply-To: <20150906091033.GC2213@tarshish>
References: <CAKpDV8vL7GHk3cQ5Jk5o4G654KfQpQAfopsrA0Fotvu+vsaKMw@mail.gmail.com>
 <20150906091033.GC2213@tarshish>
Message-ID: <CAKpDV8sMNQH6hMaSSrgAeJM0GhAN0DiSKFn7dbkMagcdtMb9AQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

One more thing ,

BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG

This is environmental variable ?

If yes then , Do i have to export so many variables manually or buildroot
support some file where i can mention these variables ?

Regards,
Katoch
On 6 Sep 2015 14:40, "Baruch Siach" <baruch@tkos.co.il> wrote:

> Hi Katoch,
>
> On Sun, Sep 06, 2015 at 02:33:15PM +0530, Dinesh Guleria wrote:
> > I am downloading kernel directly using buildroot. Then select "
> > Using an in-tree defconfig file" then
> > type the name of the defconfig.
> >
> > Here i am using a already existing defconfig file in kernel source tree.
> >
> > Now it could be the case existing configuration in Linux kernel source
> may
> > not be as per my requirement.
> >
> > My question is, can i perform kconfig operation on the kernel source
> > downloaded by buildroot , so that i can tune kernel as per my
> requirement ?
> >
> > Buildroot manual says :--
> > "use make linux-menuconfig to open the Linux configuration editor"
> > http://buildroot.uclibc.org/downloads/manual/manual.html#configure
> >
> > Or i download kernel source separately & configure it separately & tell
> > buildroot to use it ?
> >
> > How you use to deal with this situation related to kernel kconfig ?
>
> Please see "Linux kernel" in chapter 7 of the manual:
> http://nightly.buildroot.org/manual.html#_configuration_of_other_components
> .
>
> For information on storing your modified kernel configuration see section
> 9.4:
> http://nightly.buildroot.org/manual.html#customize-store-package-config.
>
> Hope this helps,
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150906/1c309ec5/attachment.html>
