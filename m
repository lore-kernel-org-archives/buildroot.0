From: Gaye Abdoulaye Walsimou <walsimou@walsimou.com>
Date: Fri, 08 May 2009 19:17:25 +0200
Subject: [Buildroot] [PATCH, RFC]: Allow cloning a git branch of uClibc
In-Reply-To: <1241608550-17668-1-git-send-email-walsimou@walsimou.com>
References: <1241608550-17668-1-git-send-email-walsimou@walsimou.com>
Message-ID: <4A046925.1090303@walsimou.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Abdoulaye Walsimou Gaye wrote:
> This patch allows to clone a branch of uClibc git repository (instead of a
> release or snapshot source).
>
> Signed-off-by: Abdoulaye Walsimou Gaye <walsimou@walsimou.com>
> ---
>  toolchain/uClibc/Config.in         |   10 ++
>  toolchain/uClibc/uClibc-git.config |  229 ++++++++++++++++++++++++++++++++++++
>  toolchain/uClibc/uclibc.mk         |   27 ++++-
>  3 files changed, 265 insertions(+), 1 deletions(-)
>  create mode 100644 toolchain/uClibc/uClibc-git.config
>   
Hello there,

No comments ...? Nacked ...?

How guys do you do to try master branch of uClibc whithin buildtroot, or
nptl branch (which was what I wanted to try)?

Cheers
