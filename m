From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 11:50:27 +0100
Subject: [Buildroot] [PATCH v2 6/8] package/dt: remove 'v' prefix
In-Reply-To: <20191027100722.64156-6-matthew.weber@rockwellcollins.com>
References: <20191027100722.64156-1-matthew.weber@rockwellcollins.com>
 <20191027100722.64156-6-matthew.weber@rockwellcollins.com>
Message-ID: <20191027115027.22c79451@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 05:07:20 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> Fixes version parsing for release-monitoring.org support.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> Changes
> v1->v2
>  - cleaned up title
> ---
>  package/dt/dt.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks. This package could have a hash for its
license file.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
