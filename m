From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 13:45:26 +0100
Subject: [Buildroot] [PATCH] wine: Bump to version 1.8
In-Reply-To: <5676114C.8020507@dawncrow.de>
References: <5676114C.8020507@dawncrow.de>
Message-ID: <20151220134526.2be0d344@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Hentschel,

On Sun, 20 Dec 2015 03:24:12 +0100, Andr? Hentschel wrote:
> Bumping to brand new stable version 1.8
> 
> Upstreamed patches are dropped, sane patch is rebased.
> Adding libpcap, pulseaudio and samba4 as soft dependencies.
> sfnt2fon moved to its own subfolder and needs to be built in host-wine.
> 
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  ...revent-call-to-memset-with-a-null-pointer.patch | 40 ----------------------
>  ...config-fix.patch => 0001-sane-config-fix.patch} | 14 ++++----
>  package/wine/0002-detect-ncursesw.patch            | 17 ---------
>  package/wine/wine.hash                             |  2 +-
>  package/wine/wine.mk                               | 31 +++++++++++++++--
>  5 files changed, 36 insertions(+), 68 deletions(-)
>  delete mode 100644 package/wine/0001-Prevent-call-to-memset-with-a-null-pointer.patch
>  rename package/wine/{0003-sane-config-fix.patch => 0001-sane-config-fix.patch} (68%)
>  delete mode 100644 package/wine/0002-detect-ncursesw.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
