From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 22:48:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/botan: bump to version 2.13.0
In-Reply-To: <20200215102505.3286075-1-fontaine.fabrice@gmail.com>
References: <20200215102505.3286075-1-fontaine.fabrice@gmail.com>
Message-ID: <20200226224846.79aa258e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 15 Feb 2020 11:25:05 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Calculate hash of tarball locally, hash of 2.13.0 is not in
>   https://botan.randombit.net/releases/sha256sums.txt
> - Update hash of license file (update in year:
>   https://github.com/randombit/botan/commit/3567c921c102448fabc8c2643a1cb6acdb6f9e5c)
> - Update indentation of hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/botan/botan.hash | 5 ++---
>  package/botan/botan.mk   | 2 +-
>  2 files changed, 3 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
