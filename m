From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 14:05:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/wget: fix build with uclibc <
 1.0.35
In-Reply-To: <20210401060222.1758478-1-fontaine.fabrice@gmail.com>
References: <20210401060222.1758478-1-fontaine.fabrice@gmail.com>
Message-ID: <20210404140526.39cc376c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  1 Apr 2021 08:02:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build of wget with uclibc < 1.0.35 is broken since bump to version
> 1.21.1 in commit 89a3f73910402ed40066eed076d5a53ac270307c
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d507f8d8ae4dd6aac1e83b7cc81017caf0d2c30e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...andom.c-fix-build-with-uclibc-1.0.35.patch | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/wget/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
