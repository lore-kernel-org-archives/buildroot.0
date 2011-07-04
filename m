From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 4 Jul 2011 23:45:17 +0200
Subject: [Buildroot] [PATCH 01/28] Makefile.package.in: Makes it
	possible to override the default extract commands
In-Reply-To: <117195471c3cd2af65c86e9ebf40a46de961183a.1309815048.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
 <117195471c3cd2af65c86e9ebf40a46de961183a.1309815048.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201107042345.18109.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Monday 04 July 2011 23:33:18 Thomas Petazzoni wrote:
> From: Allan W. Nielsen <a@awn.dk>

Maybe add Allan to the CC: list?

> When using GENTARGETS (or macroes depending on it), there is no way of
> specifying a custom extraction procedure. When using the patch one can
> simply define $(PACKAGE_NAME)_EXTRACT_CMDS which will override the
> default. If non is defined it will fall back to the default extract
> procedure.
> 
> An example could look like this:
> ---
>  package/Makefile.package.in |    7 +++++--
>  1 files changed, 5 insertions(+), 2 deletions(-)
[--SNIP--]

It seems the xample got lost in the mail. I can't check the repo, it's 403.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
