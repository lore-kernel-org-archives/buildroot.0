From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 22:05:42 +0100
Subject: [Buildroot] [PATCH 1/1] Revert "package/python-ipython: bump to
 version 7.3.0"
In-Reply-To: <20190317204055.10637-1-fontaine.fabrice@gmail.com>
References: <20190317204055.10637-1-fontaine.fabrice@gmail.com>
Message-ID: <20190318220542.55a7e8bc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Mar 2019 21:40:55 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This reverts commit bc516052593947a067c98956931df9df31ee3195.
> which adds a dependency on python3 as well as adddtional python runtime
> modules. So revert this patch to polish a better bump.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7d765d2b15bfe72b05de62e86a01d57f1696c837
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-ipython/python-ipython.hash | 7 +++----
>  package/python-ipython/python-ipython.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
