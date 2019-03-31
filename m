From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 21:16:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/tegrarcm: bump to version 1.8
In-Reply-To: <20190331145647.24516-1-fontaine.fabrice@gmail.com>
References: <20190331145647.24516-1-fontaine.fabrice@gmail.com>
Message-ID: <20190331211641.42d3e848@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 31 Mar 2019 16:56:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove patch (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...me-cryptopp-is-system-wide-installed.patch | 114 ------------------
>  package/tegrarcm/tegrarcm.hash                |   3 +-
>  package/tegrarcm/tegrarcm.mk                  |   2 +-
>  3 files changed, 3 insertions(+), 116 deletions(-)
>  delete mode 100644 package/tegrarcm/0001-Don-t-assume-cryptopp-is-system-wide-installed.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
