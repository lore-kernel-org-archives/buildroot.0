From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Oct 2016 10:55:27 +0100
Subject: [Buildroot] [PATCH v3 3/9] lttng-tools: bump to version 2.8.2
In-Reply-To: <20161031074624.7576-4-eeppeliteloop@gmail.com>
References: <20161031074624.7576-1-eeppeliteloop@gmail.com>
 <20161031074624.7576-4-eeppeliteloop@gmail.com>
Message-ID: <20161031095527.GC3389@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Philippe, All,

On 2016-10-31 03:46 -0400, Philippe Proulx spake thusly:
> The current patches are dropped because they were merged upstream.
> 
> The new patches exist to fix the build with musl. They were submitted on
> the lttng-dev mailing list, but not merged yet, or not merged in 2.8.2.
> 
> LTTng-tools now has its man pages written in AsciiDoc and they get
> converted to troff at build time. This is not needed in a Buildroot
> image anyway.
> 
> The --enable-lttng-ust/--disable-lttng-ust configure options are renamed
> to --with-lttng-ust/--without-lttng-ust in v2.8.
> 
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
> Changes v2 -> v3:
>   - Add links to original patches in patch files.
>   - Remove the original patch index from the subject of patch files.

You forgot to remove it for one patch:

> +Subject: [PATCH lttng-tools 4/4] Fix: strerror_r behavior is glibc specific

But that's not too much a problem.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
