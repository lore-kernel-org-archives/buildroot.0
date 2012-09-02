From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Sep 2012 17:16:05 +0200
Subject: [Buildroot] [PATCH] linux: add default defconfig
In-Reply-To: <1346598341-20434-1-git-send-email-arnout@mind.be>
References: <1346598341-20434-1-git-send-email-arnout@mind.be>
Message-ID: <201209021716.05404.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Sunday 02 September 2012 17:05:41 Arnout Vandecappelle (Essensium/Mind) wrote:
> Buildroot currently requires a defconfig to be supplied for the kernel:
> either a custom supplied one, or one from the kernel tree.  However,
> the kernel can (usually) also select a default defconfig, based on
> the architecture.  So make this option available to buildroot.
> 
> We also make this the default, so the user can compile a kernel with
> minimal effort.
> 
> Microblaze currently (linux-3.5) doesn't have a default defconfig.
> Older versions also lack it for some architectures (e.g. mips was
> introduced in 2.6.35) but that's nearly impossible to check for at
> buildroot level.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
