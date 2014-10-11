From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 11 Oct 2014 08:01:11 +0200
Subject: [Buildroot] Perl libraries/modules sub-menu is empty
In-Reply-To: <CAP6ETiSDXeQJhUG5b4o37HoesirmzYUncWLTghn0G5TUJ-TA-Q@mail.gmail.com>
References: <CAP6ETiSDXeQJhUG5b4o37HoesirmzYUncWLTghn0G5TUJ-TA-Q@mail.gmail.com>
Message-ID: <CAB0FRsuF8ytUa0989XLmhYZxMq4b=VZ-uOg44PTRNW+7t3jdDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-10-10 16:43 GMT+02:00 Pedro Silva <psnsilva.stuff@gmail.com>:
> Dear all,
> I am trying to add "mosh" (mobile shell) to buildroot but it is missing some
> perl modules, namely the socket module...
> The error is: Can't locate Socket.pm in @INC (you may need to install the
> Socket module).
>
> The problem is that in buildroot, with perl package checked ("Interpreter
> languages and scripting"), the "Perl libraries/modules" is empty and cause
> of that I am not able to select any additional module.
> Any hint on this issue?

In Perl, Socket is core module, so no need for additional module.
On target, you could check the presence of the module, with the
following command :

   $ perl -MSocket

Fran?ois

>
> I send an screenshot in attachment.
>
> Thanks in advance.
> Best regards,
> Pedro Silva
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
