From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 13:45:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/bitcoin: fix build with boost
 1.72
In-Reply-To: <20191226112720.3169094-1-fontaine.fabrice@gmail.com>
References: <20191226112720.3169094-1-fontaine.fabrice@gmail.com>
Message-ID: <20191226134508.5e4ea205@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Dec 2019 12:27:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/6b4d9877aa416b788b94fe44b2673149aae4af43
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...sing-header-bootlegged-by-boost-1-72.patch | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/bitcoin/0001-http-add-missing-header-bootlegged-by-boost-1-72.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
