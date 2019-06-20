From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 22:26:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/pseudo: remove package
In-Reply-To: <20190526154337.24842-1-fontaine.fabrice@gmail.com>
References: <20190526154337.24842-1-fontaine.fabrice@gmail.com>
Message-ID: <20190620222646.722df776@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 26 May 2019 17:43:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> pseudo is not used and fails to build without xattr so remove it
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0001-Fix-mixed-tab-space-indentation.patch | 105 ---------
>  ...002-Fix-missing-parentheses-at-print.patch | 190 ----------------
>  ...0003-Make-it-compatible-with-python3.patch | 215 ------------------
>  package/pseudo/pseudo.hash                    |   2 -
>  package/pseudo/pseudo.mk                      |  29 ---
>  5 files changed, 541 deletions(-)
>  delete mode 100644 package/pseudo/0001-Fix-mixed-tab-space-indentation.patch
>  delete mode 100644 package/pseudo/0002-Fix-missing-parentheses-at-print.patch
>  delete mode 100644 package/pseudo/0003-Make-it-compatible-with-python3.patch
>  delete mode 100644 package/pseudo/pseudo.hash
>  delete mode 100644 package/pseudo/pseudo.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
