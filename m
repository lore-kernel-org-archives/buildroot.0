From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 11:54:35 +0100
Subject: [Buildroot] [PATCH v2 8/8] package/flannel: remove 'v' prefix
In-Reply-To: <20191027100722.64156-8-matthew.weber@rockwellcollins.com>
References: <20191027100722.64156-1-matthew.weber@rockwellcollins.com>
 <20191027100722.64156-8-matthew.weber@rockwellcollins.com>
Message-ID: <20191027115435.4a445ba2@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 05:07:22 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> Fixes version parsing for release-monitoring.org support.
> 
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Heiko Thiery <heiko.thiery@kontron.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> Change
> v1->v2
> [Arnout
>  - dropped 'v' from LDFLAGS use of verion in a -X line
> ---
>  package/flannel/flannel.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks. This package could also be improved by
having a hash for its license file.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
