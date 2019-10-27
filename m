From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 21:35:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/ngrep: relace '_' by '.' in
 version
In-Reply-To: <20191027193224.16898-1-fontaine.fabrice@gmail.com>
References: <20191027193224.16898-1-fontaine.fabrice@gmail.com>
Message-ID: <20191027213555.76d48144@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 20:32:24 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> In order for the ngrep version to match what is given by
> release-monitoring.org, replace '_' by '.' in NGREP_VERSION
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ngrep/ngrep.hash | 2 +-
>  package/ngrep/ngrep.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
