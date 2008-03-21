From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Fri, 21 Mar 2008 19:03:06 +0100
Subject: [Buildroot] question about /tftpboot
In-Reply-To: <d449ded70803211040i68f1d764gac70fdd27632ded5@mail.gmail.com>
References: <d449ded70803211040i68f1d764gac70fdd27632ded5@mail.gmail.com>
Message-ID: <47E3F85A.7000608@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Habib Bouaziz-Viallet a ?crit :
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

There is a symbol BR2_LINUX_COPYTO to adjust that. Some time ago I found 
it broken by the target/linux/Makefile.in.advanced file and I proposed a 
patch in this bug report: http://bugs.uclibc.org/view.php?id=2384

Maybe the situation is better now.
-- 
Jean-Christian de Rivaz
