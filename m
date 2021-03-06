From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 21:28:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/libubootenv: bump to version
 e663439
In-Reply-To: <20210303203939.129235-1-brandon.maier@rockwellcollins.com>
References: <20210303203939.129235-1-brandon.maier@rockwellcollins.com>
Message-ID: <20210306212803.2d0fdd37@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  3 Mar 2021 14:39:39 -0600
Brandon Maier <brandon.maier@rockwellcollins.com> wrote:

> Include the following changes:
> 
> e663439 Always fsync file writes
> 80b7f31 Treat '=' as an illegal character in variable names
> 950f541 libuboot_env: fix calculation of usable envsize
> fb88032 Correct initialisations in libuboot_configure
> 20d1ec7 Force writing of environment if default is used
> 5ca11bd libuboot_env: correct length to usable env size length
> cd4a8f1 libuboot_env_store: fix env double-null termination
> 9510164 uboot_env: fix infinite loop on short read (EOF)
> 
> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> ---
>  package/libubootenv/libubootenv.hash | 2 +-
>  package/libubootenv/libubootenv.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
