From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 22:39:40 +0200
Subject: [Buildroot] [PATCH] package/inotify-tools: bump to version
 3.20.2.2
In-Reply-To: <5d835ebf3428198b12412ca081eb6bdf4a5aca25.1591879444.git.baruch@tkos.co.il>
References: <5d835ebf3428198b12412ca081eb6bdf4a5aca25.1591879444.git.baruch@tkos.co.il>
Message-ID: <20200618223940.726a3f48@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 11 Jun 2020 15:44:04 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Use upstream provided tarball. Drop autoreconf.
> 
> Update homepage URL. The old URL redirects to the new one.
> 
> Format hash file with two spaces delimiters.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/inotify-tools/Config.in          | 2 +-
>  package/inotify-tools/inotify-tools.hash | 4 ++--
>  package/inotify-tools/inotify-tools.mk   | 5 ++---
>  3 files changed, 5 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
