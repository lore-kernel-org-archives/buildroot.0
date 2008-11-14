From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 13 Nov 2008 22:53:48 -0200
Subject: [Buildroot] TARGET_CONFIGURE_OPTS
In-Reply-To: <ce76e3890811131642n159e96c5r769ed0e6080e599f@mail.gmail.com>
References: <ce76e3890811122014sbad333ai2101488d14ddb7f5@mail.gmail.com>
	<20081113140700.67b6db3b@surf>
	<ce76e3890811131642n159e96c5r769ed0e6080e599f@mail.gmail.com>
Message-ID: <d6cda7730811131653r4c28329fnc4a6e19c3f490285@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[cut]
> -Wl,/home/malcolm/buildroot/build_i386/staging_dir/usr/lib -mtune=i386
> -march=i386   -c -o dbmulti.o dbmulti.c
> In file included from includes.h:30,
>                 from dbmulti.c:25:
> options.h:436:2: error: #error You must compiled with either
> DROPBEAR_CLIENT or DROPBEAR_SERVER selected
> In file included from includes.h:124,
>                 from dbmulti.c:25:
[cut]

Having the same with avr32.

But the first error about the missing define shouldn't be fixed with
an includepath change AFAIK. Unless it's finding same include with
different contents in the host. Have to try it to make sure.

Kind Regards,
    Thiago A. Correa
