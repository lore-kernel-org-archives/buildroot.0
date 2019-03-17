From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 11:14:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/cups: security bump to version
 2.2.10
In-Reply-To: <20190316133648.12222-1-fontaine.fabrice@gmail.com>
References: <20190316133648.12222-1-fontaine.fabrice@gmail.com>
Message-ID: <20190317111438.662eee07@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 16 Mar 2019 14:36:48 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Fixes CVE-2018-4700: Linux session cookies used a predictable random
>   number seed: https://github.com/apple/cups/releases/tag/v2.2.10.
> - Remove fifth patch (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0005-Fix-builds-without-PAM-Issue-5283.patch   | 189 ---------------------
>  package/cups/cups.hash                             |   2 +-
>  package/cups/cups.mk                               |   2 +-
>  3 files changed, 2 insertions(+), 191 deletions(-)
>  delete mode 100644 package/cups/0005-Fix-builds-without-PAM-Issue-5283.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
