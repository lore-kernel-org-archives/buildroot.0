From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Feb 2020 22:10:30 +0100
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.15.2
In-Reply-To: <20200221080855.3159-1-ps.report@gmx.net>
References: <20200221080855.3159-1-ps.report@gmx.net>
Message-ID: <20200223221030.580da2ae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 21 Feb 2020 09:08:55 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> For details see [1].
> 
> [1] https://lists.freedesktop.org/archives/wayland-devel/2020-February/041227.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/libinput/libinput.hash | 10 +++++-----
>  package/libinput/libinput.mk   |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks. While we normally take version bumps to
next, this version bump is a minor version bump, it has only a few
commits, and according to the release notes, they fix three
regressions. For all those reasons, I've applied to master.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
