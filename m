From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Oct 2015 14:28:06 +0200
Subject: [Buildroot] [git commit] package/swupdate: add patch to fix
 build issue with some toolchains
In-Reply-To: <CAEYzJUGe08AuhCFO4mdOywLQU2Wju=ZaEiFRbwmzGMdmAaNJ5g@mail.gmail.com>
References: <20151019210337.3699681DEC@busybox.osuosl.org>
 <CAEYzJUGe08AuhCFO4mdOywLQU2Wju=ZaEiFRbwmzGMdmAaNJ5g@mail.gmail.com>
Message-ID: <20151024122806.GA3632@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bj?rn, All,

On 2015-10-24 14:01 +0200, Bj?rn Forsman spake thusly:
> This patch caused an unfortunate regression that prevents any handlers
> from being registered (runtime issue).
> This means it cannot perform any update. Upstream has reverted it.
> 
> See discussion:
> https://groups.google.com/d/msg/swupdate/oVIhJmYPT8A/eq3uZvYVDQAJ

Care to send a rever for it, please?

Also, if you can disable the package for the affected toolchains and/or
architectures, that would be great as well.

Once upstream has a better patch, we can include it and drop the
dependencies on toolchain / archs.

Thanks for the report! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
