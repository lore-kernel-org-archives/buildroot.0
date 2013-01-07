From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 7 Jan 2013 13:29:36 +0100
Subject: [Buildroot] [PATCH v2 0/2] Makefile: add toolchain target
In-Reply-To: <1356086190-906-1-git-send-email-fabio.porcedda@gmail.com>
References: <1356086190-906-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <CAHkwnC9sKsQYLaV5teV7zhtCyyvAHee=ZmS+3ytarg-oCnucpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 21, 2012 at 11:36 AM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> Hi all,
> this patch set is to add a toolchain target to be able
> to build only the toolchain right after a defconfig or a clean.
>
> Best regards
>
> Fabio Porcedda (2):
>   Makefile: rename cross target -> toolchain
>   Makefile: use toolchain target in the world target
>
>  Makefile | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> --
> 1.8.0
>

ping

--
Fabio Porcedda
