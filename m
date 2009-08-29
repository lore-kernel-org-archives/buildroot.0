From: Daniele Salvatore Albano <d.albano@gmail.com>
Date: Sat, 29 Aug 2009 09:33:36 +0200
Subject: [Buildroot] Does the kexec package buildroot-2009.05 for i386?
In-Reply-To: <2d6a9f6f0908281451i4f7e1ed1s1f5da2693b6559a4@mail.gmail.com>
References: <2d6a9f6f0908271429j91a36e9s2342c23762a8552@mail.gmail.com>
	<87fxbcro1c.fsf@macbook.be.48ers.dk>
	<2d6a9f6f0908280920q41f09dak9120c88370e14aa1@mail.gmail.com>
	<87a5b0800908280931x523f6c88k1e006634d612425f@mail.gmail.com>
	<2d6a9f6f0908281451i4f7e1ed1s1f5da2693b6559a4@mail.gmail.com>
Message-ID: <159a01660908290033y692d41e8r781a5d4c9b3445f6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ubuntu is perfectly supported, just need to use bash instead of dash, just run
sudo dpkg-reconfigure dash

and say no when it ask for sh link to dash

2009/8/28 Bill Bogstad <bogstad@pobox.com>:
> Re: suggestion to replace /bin/sh with a link to bash.
>
> Is this a workaround for an acknowledged bug in buildroot or a
> statement of lack of support for standard Ubuntu installations?
> If Ubuntu isn't supported, which Linux systems are so I can switch my
> build host environment?
>
> In either case, it doesn't matter. ?I made the switch and get exactly
> the same error. ?I'll be switching it back to the default since it
> doesn't matter and I would prefer a 'standard' Ubuntu host environment
> for other uses of the machine.
>
> Thanks,
> Bill Bogstad
>
> P.S. As I mentioned before, 08-rc3 doesn't seem to have this problem.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Daniele Salvatore Albano
Consulente Informatico
http://www.phpsoft.it
http://www.dacci.it

Servizi:
- Sviluppo in C# e PHP
- Installazione e Amministrazione sistemi Ubuntu, CentOS e Fedora
