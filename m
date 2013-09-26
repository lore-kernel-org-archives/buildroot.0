From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Thu, 26 Sep 2013 22:29:43 +0200
Subject: [Buildroot] custom application
In-Reply-To: <OF3A3A3AC8.25079E91-ON85257BF2.0069E3B1-85257BF2.0069E9F2@LocalDomain>
References: <OF3A3A3AC8.25079E91-ON85257BF2.0069E3B1-85257BF2.0069E9F2@LocalDomain>
Message-ID: <52449937.7090206@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/26/2013 09:16 PM, Naitik Amin wrote:
> Hi there,
>
> I recently used buildroot to setup my build environment, to generate
> uboot, kernel and rootfs. It has been very helpful.
>
> Now I am at a point, where I would like to add my custom application.
> Does the framework allow to create skeletals for applications ? Which
> gets compiled and be made part of rootfs by doing top level make.
>
> Thanks,
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
Hi,

check out this chapter from the docs:
http://buildroot.uclibc.org/downloads/manual/manual.html#adding-packages
It's make your life easier if you use autotools / cmake or some other
Makefile generator for your application, but also works with
hand-written Makefiles as well. For the development phase personally i
use the local site method to get the source for building, but you also
can go on and wire it directly to your source code repo.
Good luck,

-- 
br, 
Zoltan Gyarmati
mail: mr.zoltan.gyarmati at gmail.com
freenode nick: zgyarmati
