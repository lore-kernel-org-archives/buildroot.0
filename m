From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 21:26:28 +0100
Subject: [Buildroot] [PATCH/next v1] package/xerces: bump version to
 3.2.3
In-Reply-To: <20201202211102.31629-1-ps.report@gmx.net>
References: <20201202211102.31629-1-ps.report@gmx.net>
Message-ID: <20201205212628.27e85b0d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  2 Dec 2020 22:11:02 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - removed 0001-cmake-Allow-thread-checks-to-fail-and-fall-back-to-nothreads.patch
>   (upstream [1])
> 
> [1] https://github.com/apache/xerces-c/commit/c9bfe786331647237b90f5f9e35b4d2cad7aaa69
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...s-to-fail-and-fall-back-to-nothreads.patch | 38 -------------------
>  package/xerces/xerces.hash                    |  6 +--
>  package/xerces/xerces.mk                      |  2 +-
>  3 files changed, 4 insertions(+), 42 deletions(-)
>  delete mode 100644 package/xerces/0001-cmake-Allow-thread-checks-to-fail-and-fall-back-to-nothreads.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
