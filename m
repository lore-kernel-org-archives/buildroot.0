From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Sun, 05 Dec 2010 21:17:55 +0100
Subject: [Buildroot] [PATCH] util-linux: bump version to util-linux-ng
 2.18
In-Reply-To: <c26a121c90a5cc9c26c391be4e9568913df61769.1291561083.git.smiley73@users.sourceforge.net>
References: <c26a121c90a5cc9c26c391be4e9568913df61769.1291561083.git.smiley73@users.sourceforge.net>
Message-ID: <4CFBF373.5060905@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 05.12.2010 16:00, schrieb heiko at zuerker.org:
> From: Heiko Zuerker<smiley73@users.sourceforge.net>
>
>
> Signed-off-by: Heiko Zuerker<smiley73@users.sourceforge.net>
> ---
>   ...linux-2.13-pre17-hardcode-a-out-constants.patch |   41 --
>   package/util-linux/util-linux-no-nls-fix.patch     |   25 --
>   package/util-linux/util-linux-susv3-legacy.patch   |  429 --------------------
>   package/util-linux/util-linux-umount2-fix.patch    |   20 -
>   package/util-linux/util-linux.mk                   |    9 +-
>   5 files changed, 5 insertions(+), 519 deletions(-)
>   delete mode 100644 package/util-linux/util-linux-2.13-pre17-hardcode-a-out-constants.patch
>   delete mode 100644 package/util-linux/util-linux-no-nls-fix.patch
>   delete mode 100644 package/util-linux/util-linux-susv3-legacy.patch
>   delete mode 100644 package/util-linux/util-linux-umount2-fix.patch
>

Hi,

I did similar work for version 2.17.2 some time ago. You can find my 
work in bugzilla:
https://bugs.uclibc.org/show_bug.cgi?id=2677

Your version does not seem to use the autotargets infrastructure. Mine 
does. Maybe you can use my version from bugzilla, update it to 2.18 and 
present the developers a new patch.

Just a hint to prevent double work.

Regards,
Ossy
