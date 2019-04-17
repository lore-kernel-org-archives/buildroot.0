From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 08:47:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/pcre2: jit needs threads
In-Reply-To: <20190416152915.16095-1-fontaine.fabrice@gmail.com>
References: <20190416152915.16095-1-fontaine.fabrice@gmail.com>
Message-ID: <20190417084718.068dcb4c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Apr 2019 17:29:15 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add a BR2_PACKAGE_PCRE2_JIT_ARCH_SUPPORTS to be able to use it in the
> comment
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/547be5264effaf27c7f85ece88c5f5f792abd910
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pcre2/Config.in | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
