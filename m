From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:40:44 +0200
Subject: [Buildroot] [PATCH 1/2] package/systemd: bump version to 246
In-Reply-To: <20200731211847.14911-1-nolange79@gmail.com>
References: <20200731211847.14911-1-nolange79@gmail.com>
Message-ID: <20200805154044.06120366@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 Jul 2020 23:18:45 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> Add zstd as optional dependency, and
> disable new options for host-systemd.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/systemd/systemd.hash |  4 ++--
>  package/systemd/systemd.mk   | 17 ++++++++++++++---
>  2 files changed, 16 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
