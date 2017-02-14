From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Feb 2017 22:45:15 +0100
Subject: [Buildroot] [PATCH] package/libgpiod: bump version to 0.1.3
In-Reply-To: <1487064834-10378-1-git-send-email-bgolaszewski@baylibre.com>
References: <1487064834-10378-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <20170214224515.64934fd1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Feb 2017 10:33:54 +0100, Bartosz Golaszewski wrote:
> Release 0.1.2 claimed to fix an issue with requesting both types of
> line events, but actually didn't. This time it's really fixed.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  package/libgpiod/libgpiod.hash | 2 +-
>  package/libgpiod/libgpiod.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

We normally don't apply version bumps to the master branch after -rc1
has been released, but after looking at the git log between 0.1.2 and
0.1.3 it's indeed just two commits, each one-liners, fixing bugs. So I
think this qualifies for master, and applied your patch to the master
branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
