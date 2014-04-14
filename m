From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 22:42:20 +0200
Subject: [Buildroot] [PATCH 0/4] Fix lttng-tools build issue
In-Reply-To: <1397419138-8776-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1397419138-8776-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140414224220.68a5b2fb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Sun, 13 Apr 2014 21:58:54 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> This set of patches fix the lttng-tools build issue with gcc 4.7.x and
> gcc 4.8.x, by:
> 
>  * Adding appropriate patches to gcc 4.7 and gcc 4.8 in the internal
>    toolchain backend.
> 
>  * Allowing external toolchains to indicate whether they are affected
>    by the bug. For now, one toolchain known to be affected is marked
>    as such, the other toolchains will have to be tested progressively.
> 
>  * Making the lttng-tools depend on toolchains not affected by the
>    bug.
> 
> Thomas Petazzoni (4):
>   gcc: add fix for PR 58595 to gcc 4.8.2
>   gcc: add fix for PR 58595 to gcc 4.7.3
>   toolchain: add option to declare toolchains affected by gcc PR 58595
>   lttng-tools: mark as affected by gcc bug 58595

Applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
