From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:51:54 +0200
Subject: [Buildroot] [PATCH 2/5] package/systemd: remove libblkid
 dependency
In-Reply-To: <20200731215345.19212-3-nolange79@gmail.com>
References: <20200731215345.19212-1-nolange79@gmail.com>
 <20200731215345.19212-3-nolange79@gmail.com>
Message-ID: <20200805155154.2e8885e3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 Jul 2020 23:53:42 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> this dependency is optional, it is used to
> allow udev to add information to blockdevices.
> Aslong as MOUNT or FSCK are enabled, it will end up enabled
> anyway, but this seems more clear and correct.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/systemd/Config.in  | 1 -
>  package/systemd/systemd.mk | 7 ++++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
