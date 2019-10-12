From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Oct 2019 15:38:20 +0200
Subject: [Buildroot] [PATCH 1/2] package/tmux: bump to version 2.9a
In-Reply-To: <20191011030839.15308-1-ricardo.martincoski@gmail.com>
References: <20191011030839.15308-1-ricardo.martincoski@gmail.com>
Message-ID: <20191012153820.12497daa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 11 Oct 2019 00:08:38 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> This is a bug fix release.
> Changelog: https://raw.githubusercontent.com/tmux/tmux/2.9a/CHANGES
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> ./utils/test-pkg -a -p tmux
> 44 builds, 4 skipped, 0 build failed, 0 legal-info failed
> ---
>  package/tmux/tmux.hash | 2 +-
>  package/tmux/tmux.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
