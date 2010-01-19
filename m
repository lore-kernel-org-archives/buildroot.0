From: Julien Boibessot <julien.boibessot@free.fr>
Date: Tue, 19 Jan 2010 19:53:54 +0100
Subject: [Buildroot] toolchain problem:wrong path in libSDL.la
In-Reply-To: <4B55DEAF.40808@gmx.de>
References: <4B55DEAF.40808@gmx.de>
Message-ID: <4B55FFC2.3010800@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jens,

Jens a ?crit :
> I'm using recent version 2009.11 and I've added SDL package to my
> configuration.
>
> My br installation is at /mnt/ext3data/buildroot/
>
> but br creates a wrong path of libdir in libSDL.la
please find attached here a patch that can probably solve your problem.
Sorry but I didn't take time yet to submit it to BR team.
http://armadeus.git.sourceforge.net/git/gitweb.cgi?p=armadeus/armadeus;a=blob;f=patches/buildroot/078-sdl-correct_libdir_path_in_libSDL.la.patch;h=c455834241d222b72865032c333c83630bd571b0;hb=HEAD

Hope it will help you...

Regards,
Julien
