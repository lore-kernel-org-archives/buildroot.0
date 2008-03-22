From: Habib Bouaziz-Viallet <habib.bouaziz@gmail.com>
Date: Sat, 22 Mar 2008 17:54:00 +0100
Subject: [Buildroot] question about /tftpboot
In-Reply-To: <47E535F7.5050707@eclis.ch>
References: <d449ded70803211040i68f1d764gac70fdd27632ded5@mail.gmail.com>
	<47E3F85A.7000608@eclis.ch>
	<d449ded70803211116k29dfe743u304b9bc59f317791@mail.gmail.com>
	<47E42205.40609@eclis.ch> <47E4269D.3060207@eclis.ch>
	<d449ded70803220329u576c9854kf10c4fa1cf1f4e48@mail.gmail.com>
	<47E535F7.5050707@eclis.ch>
Message-ID: <d449ded70803220954o3faacc4dn6d1668334432a782@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/3/22, Jean-Christian de Rivaz <jc@eclis.ch>:
> Habib Bouaziz-Viallet a ?crit :
>
>
> >>  > I am interested to know if it work for your case.
>  > Oh it does not work for me ... unfortunately. I resolved the pb by a
>  > symbolic link.
>
>
> Ok. Can you give me the error message or the configuration to reproduce
>  the problem ? I have some motivation to solve this issue.
As i noticed in my previous post i make a symlink from /tftpboot -->
/home/ ..../buildroot/tftpboot and build process works fine now

habib at mizar:~/PROJETS/PERSO/buildroot$ ls tftpboot/
at91sam9260dfc-dataflashcardboot-2.3.bin        autoscript.loopee!  vmlinux
at91sam9260dfc-u-boot-1.2.0-atmel-20080322.bin  bzImage

So what configuration would you see ? Is it my .config in buildroot root tree ?

>
>  Thanks anyway for your test.
>  --
>
> Jean-Christian de Rivaz
>


-- 
M. Bouaziz-Viallet
