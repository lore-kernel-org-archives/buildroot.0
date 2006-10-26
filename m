From: Paugam Luc <luc.paugam@thomson.net>
Date: Thu, 26 Oct 2006 12:25:04 +0200
Subject: [Buildroot] ERROR: ccache says "(No such file or directory)" !!!
Message-ID: <E55CA8ECFBA85E4CB8E8173566B9EFEB287C2C@rennsmail04.eu.thmulti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for pointing it out.
That's exactly what I was looking for.

Regards - Luc 

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org]
On Behalf Of Fredrik Roubert
Sent: jeudi 26 octobre 2006 11:33
To: buildroot at uclibc.org
Subject: Re: [Buildroot] ERROR: ccache says "(No such file or
directory)" !!!

On Wed 25 Oct 17:37 CEST 2006, Paugam Luc wrote:

> It seems that ccache keep the information of the build directory path!

> I am wondering why? It does not allow to install the toolchain in 
> other environment system.

In order to build a cross compiler that you can use outside of the build
environment, you need to first apply Ed Swierk's patch to buildroot:

http://www.busybox.net/lists/buildroot/2006-July/000027.html

I don't know why the default behaviour is the way it is, but I would
really like to know if there is a good reason for it. See:

http://www.busybox.net/lists/buildroot/2006-October/000260.html
http://www.busybox.net/lists/buildroot/2006-October/000333.html

Cheers // Fredrik Roubert

-- 
Barco Medical Imaging          |  +32 56 233549
http://www.barco.com/medical/  |  fredrik.roubert at barco.com
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
