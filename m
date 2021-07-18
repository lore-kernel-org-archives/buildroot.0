From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 23:30:00 +0200
Subject: [Buildroot] [PATCH 1/2] package/spice: security bump to version
 0.15.0
In-Reply-To: <20210616061002.345235-1-fontaine.fabrice@gmail.com>
References: <20210616061002.345235-1-fontaine.fabrice@gmail.com>
Message-ID: <20210718233000.7d0d08df@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 16 Jun 2021 08:10:01 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2021-20201: A flaw was found in spice in versions before
> 0.14.92. A DoS tool might make it easier for remote attackers to cause a
> denial of service (CPU consumption) by performing many renegotiations
> within a single connection.
> 
> https://gitlab.freedesktop.org/spice/spice/-/tags/v0.15.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/spice/spice.hash | 2 +-
>  package/spice/spice.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
