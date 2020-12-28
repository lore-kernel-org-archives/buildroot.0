From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Dec 2020 22:54:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/libepoxy: bump to version 1.5.5
In-Reply-To: <20201223223544.198464-1-aperez@igalia.com>
References: <20201223223544.198464-1-aperez@igalia.com>
Message-ID: <20201228225401.7a4a8ce3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Dec 2020 00:35:44 +0200
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This version removes Python 2 support, the autotools based build system
> (not a problem as Buildroot has been using Meson for a while), and some
> small fixes.
> 
> Full release notes can be found at:
> 
>   https://github.com/anholt/libepoxy/releases/tag/1.5.5
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/libepoxy/libepoxy.hash | 4 ++--
>  package/libepoxy/libepoxy.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
