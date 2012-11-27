From: pritam.ghanghas at gmail.com <pritam.ghanghas@gmail.com>
Date: Tue, 27 Nov 2012 20:54:48 +0530
Subject: [Buildroot] adding network manager to a older buildroot
In-Reply-To: <CAHXCMMLT=yDDyWxCnhsKdgF+Q5pqFS+xcEYsv-9=ikhEB5s4yA@mail.gmail.com>
References: <CABTvgZh+PP_0vwb=ahsDi9PcjYe7DdST1GRkWWA-_dozaEvZKw@mail.gmail.com>
 <CAHXCMMLT=yDDyWxCnhsKdgF+Q5pqFS+xcEYsv-9=ikhEB5s4yA@mail.gmail.com>
Message-ID: <CABTvgZjgbQzGnSzv52mz0RApRv27TdJ3gCmOUfod4_fKgLEhGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you Samuel,


On Tue, Nov 27, 2012 at 8:37 PM, Samuel Martin <s.martin49@gmail.com> wrote:

> Hi Pritram,
>
> 2012/11/27 pritam.ghanghas at gmail.com <pritam.ghanghas@gmail.com>:
> > Hi
> >
> > I am new to buildroot, still going through the documentation and getting
> my
> > head around it. I am using a SDK provided by intel for CE5300 which uses
> > buildroot 2009.05.
> > The application that I am trying to port on this platform uses network
> > manager.
> > I checked latest buildroot 2012.08 also. It seems even that doesn't
> support
> > network manager. So how do I achieve Network manager support now.
>
> Network-manager is in Buildroot since the 2012.02 release, under the
> "Networking Application" submenu.
>
> You certainly don't see it because on of the following requirement is umet:
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> BR2_INET_IPV6
> BR2_LARGEFILE
> BR2_USE_WCHAR
> BR2_TOOLCHAIN_HAS_THREADS
> BR2_USE_MMU
>
>
> Regards,
>
> any ideas about dropping in new buildroot onto old scripts(meant for old
build root). Is there any recommended upgrade path.

> --
> Sam
>



-- 
pritam
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121127/112473ea/attachment.html>
