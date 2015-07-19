From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jul 2015 15:29:50 +0200
Subject: [Buildroot] [PATCH v7 1/1] Added linux drivers backports project
In-Reply-To: <1435791533-25991-1-git-send-email-petr.vorel@gmail.com>
References: <1435791533-25991-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <20150719132950.GC4020@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2015-07-02 00:58 +0200, Petr Vorel spake thusly:
> https://backports.wiki.kernel.org
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Since there's quite some work left to be done, and we would like to have
this as part of the next release, I'm adopting this patch to fix the
remaining issues that Arnout and I raised earlier.

However, I have a question, see below...

> diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
> new file mode 100644
> index 0000000..d45166a
> --- /dev/null
> +++ b/package/linux-backports/linux-backports.mk
> @@ -0,0 +1,64 @@
> +################################################################################
> +#
> +# linux-backports
> +#
> +################################################################################
> +
> +LINUX_BACKPORTS_VERSION_MAJOR = 4.0.1

How are the versions of Linux and linux-backports related?

I.e. does linux-backports have to match the Linux version, or can we
use whatever linux-backports version with whatever Linux version?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
