From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 20:54:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: drop patch
In-Reply-To: <20200902200926.3794724-1-fontaine.fabrice@gmail.com>
References: <20200902200926.3794724-1-fontaine.fabrice@gmail.com>
Message-ID: <20200903205406.1f86b93e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  2 Sep 2020 22:09:26 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Patch is already in version 0.11.17
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3741e47ec8bfc594aa37ac33b7927e5b73183daf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...al-fix-build-failure-for-getresuid32.patch | 31 -------------------
>  1 file changed, 31 deletions(-)
>  delete mode 100644 package/stress-ng/0002-stress-sysinval-fix-build-failure-for-getresuid32.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
