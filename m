From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 4 Oct 2015 12:12:08 +0200
Subject: [Buildroot] [PATCH v4 2/3] skeleton: Remove bash specific files
In-Reply-To: <1443884002-13585-2-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443884002-13585-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1443884002-13585-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <5610FB78.2070107@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime,

Maxime Hadjinlian wrote:
> Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

> ---> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>   system/skeleton/root/.bash_history | 0
>   system/skeleton/root/.bash_logout  | 7 -------
>   system/skeleton/root/.bash_profile | 7 -------
>   3 files changed, 14 deletions(-)
>   delete mode 100644 system/skeleton/root/.bash_history

...and I guess this one is not even useful when using bash.

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
[Build- and runtime-tested with qemu_arm_versatile_defconfig]
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
