From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Jan 2013 17:38:32 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
	yem-instrument-build
In-Reply-To: <cover.1358697765.git.yann.morin.1998@free.fr>
References: <cover.1358697765.git.yann.morin.1998@free.fr>
Message-ID: <201301201738.32066.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sunday 20 January 2013 Yann E. MORIN wrote:
> This series adds some intrumentation to the pkg-infra so that it is easier
> for the autobuilders to extract meaningfull information about the reason
> of failures.
[--SNIP--]
> Yann E. MORIN (7):
>       toolchain/external: sprinkle with some calls to MESSAGE
>       toolchain/crosstool-ng: sprinkle with some calls to MESSAGE
>       toolchain/gcc: sprinkle with some calls to MESSAGE
>       toolchain/kernel-headers: sprinkle with some calls to MESSAGE
>       toolchain/uClibc: sprinkle with some calls to MESSAGE
>       fs/common.mk: delay evaluation of variables.
>       pkg-infra: log current message

Arg! Arnout's authorship was lost when I added his patch to my tree... :-(
Let me fix that...

[git-am choked on the patch because of some missing "newline at end
of file", hence I applied it manually, and forgot to change authorship]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
