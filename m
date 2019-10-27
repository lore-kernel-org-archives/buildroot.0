From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 11:47:31 +0100
Subject: [Buildroot] [PATCH v2 1/8] package/softether: remove 'v' prefix
In-Reply-To: <20191027100722.64156-1-matthew.weber@rockwellcollins.com>
References: <20191027100722.64156-1-matthew.weber@rockwellcollins.com>
Message-ID: <20191027114731.67163ba0@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 05:07:15 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> Fixes version parsing for release-monitoring.org support.
> 
> Cc: Heiko Thiery <heiko.thiery@kontron.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> 
> ---
> Changes
> v1 -> v2
> [Heiko
>  - updated hash archive check to remove v
> ---
>  package/softether/softether.hash | 2 +-
>  package/softether/softether.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
