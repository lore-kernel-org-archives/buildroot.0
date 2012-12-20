From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Dec 2012 20:56:00 +0100
Subject: [Buildroot] [PATCH] toolchain-crosstool-ng: update PPL and
	CLoog versions in default configs
In-Reply-To: <1355959792-13804-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1355959792-13804-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <201212202056.00373.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 20 December 2012 Thomas Petazzoni wrote:
> We have updated our Crosstool-NG configuration to gcc 4.6.x, but the
> PPL and CLoog versions were not updated accordingly. With gcc 4.6.x,
> at least PPL 0.11 is needed, and only CLoog > 0.15.9 can work with PLL
> 0.11.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/c22758a30c3b8abb582150cefd7099605c527e14/build-end.log
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

The eglibc build is broken for a defconfig:
    /tmpfs/ccvkz3ro.s:33: Error: CFI instruction used without
    previous .cfi_startproc
But that's another issue.

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
