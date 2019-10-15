From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Oct 2019 09:18:56 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/network-manager: bump to
 version 1.21.2
In-Reply-To: <20191014215600.92075-1-james.hilliard1@gmail.com>
References: <20191014215600.92075-1-james.hilliard1@gmail.com>
Message-ID: <20191015091856.6413e976@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Oct 2019 15:56:00 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> per upstream commit: e9f2ea6c22f36cb7986d2228763629ed44b9e76b
> https://github.com/NetworkManager/NetworkManager/commit/e9f2ea6c22f36cb7986d2228763629ed44b9e76b
> 
> The update to the GPL text in COPYRIGHT is purely cosmetic.
> 
> Added COPYING.LGPL to licenses for libnm.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/network-manager/network-manager.hash | 7 ++++---
>  package/network-manager/network-manager.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
