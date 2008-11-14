From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 14 Nov 2008 12:34:44 -0200
Subject: [Buildroot] TARGET_CONFIGURE_OPTS
In-Reply-To: <ce76e3890811131707q460a9edet13e0d0d81575c67c@mail.gmail.com>
References: <ce76e3890811122014sbad333ai2101488d14ddb7f5@mail.gmail.com>
	<20081113140700.67b6db3b@surf>
	<ce76e3890811131642n159e96c5r769ed0e6080e599f@mail.gmail.com>
	<d6cda7730811131653r4c28329fnc4a6e19c3f490285@mail.gmail.com>
	<ce76e3890811131707q460a9edet13e0d0d81575c67c@mail.gmail.com>
Message-ID: <d6cda7730811140634w3b5a2e4bqcaec284d38ffb295@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> But the first error about the missing define shouldn't be fixed with
>> an includepath change AFAIK. Unless it's finding same include with
>> different contents in the host. Have to try it to make sure.
>
> The dropbear makefile adds "-DDROPBEAR_CLIENT -DDROPBEAR_SERVER" to
> CFLAGS (along with the include path libtomcrypt/src/headers) so
> everything works if dropbear's CFLAGS gets used.


I see... commited as r24038.
