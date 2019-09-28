From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 22:39:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/cups: bump to version 2.3.0
In-Reply-To: <20190928065611.25788-1-fontaine.fabrice@gmail.com>
References: <20190928065611.25788-1-fontaine.fabrice@gmail.com>
Message-ID: <20190928223902.6665c1bc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Sep 2019 08:56:11 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update first, second and fourth patches
> - Update license to Apache-2.0 with GPL2/LGPL2 exception, see:
>   https://github.com/apple/cups/commit/e310189747c161ac6e737eedadf8f45d11bf2253
>   https://github.com/apple/cups/commit/7b6d49eec95fef100d017df6f1f577c72ca60577
> - Remove CUPS_INSTALL_{STAGING,TARGET}_OPTS as setting DSTROOT is not
>   needed since
>   https://github.com/apple/cups/commit/083672b18ce39071613f0924df904ef91b65ded2
> - --{with,without}-{java,perl,php,python} are not supported anymore:
>   https://github.com/apple/cups/commit/98491ecc6fb571869d0947096982a64d6ec16a7d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...emove-man-from-BUILDDIRS-in-configure.patch |  6 ++++--
>  package/cups/0002-Do-not-use-genstrings.patch  |  8 +++++---
>  .../0004-Remove-PIE-flags-from-the-build.patch | 18 ++++++++++--------
>  package/cups/cups.hash                         |  5 +++--
>  package/cups/cups.mk                           | 18 +++---------------
>  5 files changed, 25 insertions(+), 30 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
