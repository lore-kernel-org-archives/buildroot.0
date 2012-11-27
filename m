From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 27 Nov 2012 16:07:21 +0100
Subject: [Buildroot] adding network manager to a older buildroot
In-Reply-To: <CABTvgZh+PP_0vwb=ahsDi9PcjYe7DdST1GRkWWA-_dozaEvZKw@mail.gmail.com>
References: <CABTvgZh+PP_0vwb=ahsDi9PcjYe7DdST1GRkWWA-_dozaEvZKw@mail.gmail.com>
Message-ID: <CAHXCMMLT=yDDyWxCnhsKdgF+Q5pqFS+xcEYsv-9=ikhEB5s4yA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Pritram,

2012/11/27 pritam.ghanghas at gmail.com <pritam.ghanghas@gmail.com>:
> Hi
>
> I am new to buildroot, still going through the documentation and getting my
> head around it. I am using a SDK provided by intel for CE5300 which uses
> buildroot 2009.05.
> The application that I am trying to port on this platform uses network
> manager.
> I checked latest buildroot 2012.08 also. It seems even that doesn't support
> network manager. So how do I achieve Network manager support now.

Network-manager is in Buildroot since the 2012.02 release, under the
"Networking Application" submenu.

You certainly don't see it because on of the following requirement is umet:
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
BR2_INET_IPV6
BR2_LARGEFILE
BR2_USE_WCHAR
BR2_TOOLCHAIN_HAS_THREADS
BR2_USE_MMU


Regards,

-- 
Sam
