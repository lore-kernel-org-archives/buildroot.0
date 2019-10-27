From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 09:52:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/gvfs: fix static build with
 libarchive
In-Reply-To: <20191027073317.27107-1-fontaine.fabrice@gmail.com>
References: <20191027073317.27107-1-fontaine.fabrice@gmail.com>
Message-ID: <20191027095242.051e4da2@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 08:33:17 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use pkg-config to retrieve static dependencies of libarchive in gvfs.mk
> instead of patching configure.ac as upstream switched to meson
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/486187bb7b8800f44a8c173af518b84e68e53584
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gvfs/gvfs.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
