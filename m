From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 16:34:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/dhcp: bump to version 4.4.1
In-Reply-To: <20190418131733.2027-1-fontaine.fabrice@gmail.com>
References: <20190418131733.2027-1-fontaine.fabrice@gmail.com>
Message-ID: <20190420163418.158abec8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Apr 2019 15:17:33 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Use --with-bind-extra-config option to:
>   - add --without-zlib otherwise static build will fail if zlib is found
>     on host
>   - Add --without-dlopen otherwise static build will fail
> - Drop all patches (already in version)
> - Drop autoreconf (not needed anymore)
> - Update license to MPL-2.0:
>   https://www.isc.org/blogs/isc-dhcp-moves-to-mpl-2-0-license
> - Update hash of license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dhcp/0001-bind-cross-compile.patch    | 24 --------
>  ...gs-a-socket-descriptor-leak-in-OMAPI.patch | 51 ----------------
>  ...uffer-overrun-in-pretty_print_option.patch | 59 -------------------
>  ...rected-refcnt-loss-in-option-parsing.patch | 40 -------------
>  package/dhcp/dhcp.hash                        |  6 +-
>  package/dhcp/dhcp.mk                          | 26 ++++----
>  6 files changed, 16 insertions(+), 190 deletions(-)
>  delete mode 100644 package/dhcp/0001-bind-cross-compile.patch
>  delete mode 100644 package/dhcp/0002-v4_3-Plugs-a-socket-descriptor-leak-in-OMAPI.patch
>  delete mode 100644 package/dhcp/0003-Correct-buffer-overrun-in-pretty_print_option.patch
>  delete mode 100644 package/dhcp/0004-Corrected-refcnt-loss-in-option-parsing.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
