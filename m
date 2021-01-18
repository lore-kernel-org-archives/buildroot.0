From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:56:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/xerces: renumber patch
In-Reply-To: <20210118213300.662442-1-fontaine.fabrice@gmail.com>
References: <20210118213300.662442-1-fontaine.fabrice@gmail.com>
Message-ID: <20210118225642.1585994d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Jan 2021 22:33:00 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 7f115d2de4276972098b8f4cfeb0150c8e851d89 forgot to renumber the
> remaining patch
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ng-with-curl.patch => 0001-fix-static-linking-with-curl.patch} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename package/xerces/{0002-fix-static-linking-with-curl.patch => 0001-fix-static-linking-with-curl.patch} (100%)

Applied to master, thanks. Perhaps we should have a "make
check-package" check for improperly numbered patches ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
