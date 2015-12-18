From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Dec 2015 23:32:34 +0100
Subject: [Buildroot] add user script to /etc/rc before rootfs is created
In-Reply-To: <1161230987.710604.1450475930986.JavaMail.yahoo@mail.yahoo.com>
References: <1161230987.710604.1450475930986.JavaMail.yahoo.ref@mail.yahoo.com>
 <1161230987.710604.1450475930986.JavaMail.yahoo@mail.yahoo.com>
Message-ID: <20151218223234.GB10982@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Henry, all,

On 2015-12-18 21:58 +0000, hong zhang spake thusly:
> List,
> I add user script to /etc/rc/... so that the script can be executed right after kernel is up.
> What I am doing now is:
> After building first rootfs, expand rootfs and add my script to /etc/rc... area.
> Is it possible to add my script to buildroot before rootfs is created?

Yes, this is covered in the manual, see;
    https://buildroot.org/downloads/manual/manual.html#rootfs-custom

Regards,
Yann E. MORIN.

> ---henry

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
