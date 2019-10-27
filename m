From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 11:53:22 +0100
Subject: [Buildroot] [PATCH v2 7/8] package/pru-software-support: remove
 'v' prefix
In-Reply-To: <20191027100722.64156-7-matthew.weber@rockwellcollins.com>
References: <20191027100722.64156-1-matthew.weber@rockwellcollins.com>
 <20191027100722.64156-7-matthew.weber@rockwellcollins.com>
Message-ID: <20191027115322.1e88cf0c@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 05:07:21 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> Fixes version parsing for release-monitoring.org support.
> 
> Cc: Heiko Thiery <heiko.thiery@kontron.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> 
> ---
> Changes
> v1->v2
> [Heiko
>  - Fixed hash not found by defining the software src archive name
> ---
>  package/pru-software-support/pru-software-support.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
