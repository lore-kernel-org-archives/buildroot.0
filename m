From: John Voltz <john.voltz@gmail.com>
Date: Fri, 21 Mar 2008 14:07:14 -0400
Subject: [Buildroot] question about /tftpboot
In-Reply-To: <d449ded70803211040i68f1d764gac70fdd27632ded5@mail.gmail.com>
References: <d449ded70803211040i68f1d764gac70fdd27632ded5@mail.gmail.com>
Message-ID: <46a136670803211107p359bcd92k6090aa1fad5e4582@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think this is done by changing the tftp configuration file in /etc after
it is installed. There might also be something under /etc/inet.d

John

On Fri, Mar 21, 2008 at 1:40 PM, Habib Bouaziz-Viallet <
habib.bouaziz@gmail.com> wrote:

> Hi all !
>
> I would like my tftp server provides access to another directory (e.g
> /var/... param configured with /etc/inetd.conf  with my GNU Debian)
>
> '/ tftpboot'. Changing '/ tftpboot' is apparently not possible from
> 'make menuconfig'
>
> How do i do ? Many thanks
>
> --
> M. Bouaziz-Viallet
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080321/f7c4f289/attachment.htm 
