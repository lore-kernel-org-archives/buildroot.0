From: Habib Bouaziz-Viallet <habib.bouaziz@gmail.com>
Date: Fri, 21 Mar 2008 19:20:57 +0100
Subject: [Buildroot] question about /tftpboot
In-Reply-To: <46a136670803211107p359bcd92k6090aa1fad5e4582@mail.gmail.com>
References: <d449ded70803211040i68f1d764gac70fdd27632ded5@mail.gmail.com>
	<46a136670803211107p359bcd92k6090aa1fad5e4582@mail.gmail.com>
Message-ID: <d449ded70803211120x6d84c3f4u11ff036665bd7ff9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/3/21, John Voltz <john.voltz@gmail.com>:
> I think this is done by changing the tftp configuration file in /etc after
> it is installed. There might also be something under /etc/inet.d
Hi John !

In fact tftp server is not involved in this issue, the fact is the
'/tftpboot' location choice in make menuconfig did not work, i.e
changing 'tftpboot' by '/var/tftpboot' did not work
>
> John
>
Best regards
>
> On Fri, Mar 21, 2008 at 1:40 PM, Habib Bouaziz-Viallet
> <habib.bouaziz@gmail.com> wrote:
>
> >
> > Hi all !
> >
> > I would like my tftp server provides access to another directory (e.g
> > /var/... param configured with /etc/inetd.conf  with my GNU Debian)
> >
> > '/ tftpboot'. Changing '/ tftpboot' is apparently not possible from
> > 'make menuconfig'
> >
> > How do i do ? Many thanks
> >
> > --
> > M. Bouaziz-Viallet
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >
>
>
> _______________________________________________
>  buildroot mailing list
>  buildroot at uclibc.org
>  http://busybox.net/mailman/listinfo/buildroot
>


-- 
M. Bouaziz-Viallet
