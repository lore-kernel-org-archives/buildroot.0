From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 28 Nov 2014 22:32:47 +0100
Subject: [Buildroot] buildroot 2014.11-rc3 mono fails
In-Reply-To: <20141128211656.GA4188@free.fr>
References: <612310928.432121.1417205315374.JavaMail.open-xchange@oxbaltgw06.schlund.de>
 <CA+TH9V=Y7vf6r1nWmYcK3exEyDP7W=5N-VtaUae9sWs-UB3ZJQ@mail.gmail.com>
 <20141128211656.GA4188@free.fr>
Message-ID: <CA+TH9V=BJOOczW2J_cvB-n-HhRt2N-GAaK6dc=W-_agM5e-jrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

> Then that's a problem for Buildroot.
>
> It would be nice to find a solution so that an existing native mono
> compiler does not break the build.

This is the way mono compilation or cross compilation works. Probably
messing around with makefile could force to always use the internal
mono compiler.

I'll try to take a look in week end.

Sincerely, Angelo

>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
