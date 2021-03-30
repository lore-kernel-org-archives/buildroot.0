From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Mar 2021 22:25:22 +0200
Subject: [Buildroot] [PATCH v1] package/start-stop-daemon: bump version
 to 1.20.7.1
In-Reply-To: <20210321210013.10407-1-ps.report@gmx.net>
References: <20210321210013.10407-1-ps.report@gmx.net>
Message-ID: <20210330222522.2cb10dc5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 21 Mar 2021 22:00:13 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - rebased 0001-add-uclibc-alias-and-musl.patch
> - rebased 0002-just-warn-on-missing-arch.patch
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  .../0001-add-uclibc-alias-and-musl.patch      | 58 ++++++++++++-------
>  .../0002-just-warn-on-missing-arch.patch      | 38 ++++++++----
>  .../start-stop-daemon/start-stop-daemon.hash  |  4 +-
>  .../start-stop-daemon/start-stop-daemon.mk    |  4 +-
>  4 files changed, 66 insertions(+), 38 deletions(-)

Applied to master, thanks. Of course, it would be nice if we could
upstream our two patches :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
