From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 05 Sep 2013 14:48:55 +0200
Subject: [Buildroot] [PATCH 4/4] toolchain/wrapper: add option to print
 one argument per line
In-Reply-To: <e1d03e22b10b073d5906a4b6df22c72d38bfd8c2.1378330371.git.yann.morin.1998@free.fr>
References: <cover.1378330371.git.yann.morin.1998@free.fr>
 <e1d03e22b10b073d5906a4b6df22c72d38bfd8c2.1378330371.git.yann.morin.1998@free.fr>
Message-ID: <52287DB7.6080008@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> In case there are many arguments passed to the tools, the command line
> can get very long, and difficult to parse visually.
>
> For example, the Linux kernel passes a lot of arguments to gcc (at least
> 45, which gives 53 with our hard-coded args). Looking at such a command
> line is daunting.
>
> So, add the possibility to print each argument on its own line.
>
> Also, enclose all args between single quotes, so the command line
> can be safely copy-pasted without special chars (spaces, $) being
> inrerpreted by the shell.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

This feature should be mentioned in the docs.

Apart for that:

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
[Tested on arm_foundationv8_defconfig]

Luca
