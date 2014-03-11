From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 11 Mar 2014 18:38:35 +0100
Subject: [Buildroot] [PATCH 0/6] Miscellauneus patches
In-Reply-To: <1394540278-28740-1-git-send-email-fabio.porcedda@gmail.com>
References: <1394540278-28740-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <CAHkwnC-qdNPvFsbBJimmb=qfzxVH-1SAzE9At0-w8HSaxsChJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 11, 2014 at 1:17 PM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> Some miscellaneus patches.
>
> v2:
>  - Add three patches
>  - Remove the already merged patch
>
> Best regards
>
> Fabio Porcedda (6):
>   barebox: fix coding style
>   Remove "dirs" dependencies
>   Makefile: fix coding style
>   luajit: needs for 32bit archictectures a 32bit host gcc
>   infra: add to luarocks support for top-level parallel make
>   Makefile: do not add the toolchain target to the TARGETS variable
>
>  Makefile                 | 190 +++++++++++++++++++++++------------------------
>  boot/barebox/barebox.mk  |  32 ++++----
>  package/luajit/Config.in |   1 +
>  package/pkg-luarocks.mk  |   8 +-
>  package/uclibc/uclibc.mk |   2 +-
>  5 files changed, 120 insertions(+), 113 deletions(-)
>
> --
> 1.8.3.2
>

I've forgotten to add the V2 subfix to the patchset.

Regards
-- 
Fabio Porcedda
