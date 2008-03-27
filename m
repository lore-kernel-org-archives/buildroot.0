From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 27 Mar 2008 11:37:54 -0300
Subject: [Buildroot] make clean problem and patch
In-Reply-To: <20080327125053.GE13379@mx.loc>
References: <47EB6E57.4080101@logicway.de> <20080327125053.GE13379@mx.loc>
Message-ID: <d6cda7730803270737x43efeb83o61a40a1ff5bff704@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard,

   You are also missing dropbear, which does not have an uninstall
target and causes make clean to fail.

Cheers,
   Thiago A. Correa

On Thu, Mar 27, 2008 at 9:50 AM, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
> On Thu, Mar 27, 2008 at 10:52:23AM +0100, Arndt Kritzner wrote:
>  >"make clean" fails after incomplete build attempts because of missing
>  >files or directories. The attached patch precedes the clean actions with
>  >a "-" to ignore these errors. With atstk1002_defconfig the packages
>  >avahi, dropbear, file, lzo, ncftp and strace caused this sort of aborts.
>  >The attached patch concerns these packages.
>
>  Unfortunately your list was incomplete.
>  Fixed in my tree, thanks for mentioning this!
>
>  PS:
>  http://repo.or.cz/w/buildroot.git?a=commit;h=4c0e0b63bdc1fd65889bbaeb3d6ad8eb4d0fe22f
>
>  cheers,
>  Bernhard
>  _______________________________________________
>  buildroot mailing list
>  buildroot at uclibc.org
>  http://busybox.net/mailman/listinfo/buildroot
>
