From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Sep 2013 15:55:39 +0200
Subject: [Buildroot] [PATCH 4/4] toolchain/wrapper: add option to print
 one argument per line
In-Reply-To: <52287DB7.6080008@lucaceresoli.net>
References: <cover.1378330371.git.yann.morin.1998@free.fr>
 <e1d03e22b10b073d5906a4b6df22c72d38bfd8c2.1378330371.git.yann.morin.1998@free.fr>
 <52287DB7.6080008@lucaceresoli.net>
Message-ID: <20130905135539.GB3136@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2013-09-05 14:48 +0200, Luca Ceresoli spake thusly:
> Yann E. MORIN wrote:
> >From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> >In case there are many arguments passed to the tools, the command line
> >can get very long, and difficult to parse visually.
> >
> >For example, the Linux kernel passes a lot of arguments to gcc (at least
> >45, which gives 53 with our hard-coded args). Looking at such a command
> >line is daunting.
> >
> >So, add the possibility to print each argument on its own line.
> >
> >Also, enclose all args between single quotes, so the command line
> >can be safely copy-pasted without special chars (spaces, $) being
> >inrerpreted by the shell.
> >
> >Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> This feature should be mentioned in the docs.

Well, for now, BR_DEBUG_WRAPPER is not even documented.
But I agree this is missing; will add.

> Apart for that:
> 
> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> [Tested on arm_foundationv8_defconfig]

I'll add those when I respin the patch. Thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
