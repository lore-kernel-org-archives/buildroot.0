From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 14:07:11 +0200
Subject: [Buildroot] [PATCH v1] package/valgrind: bump version to 3.17.0
In-Reply-To: <20210329174111.24543-1-ps.report@gmx.net>
References: <20210329174111.24543-1-ps.report@gmx.net>
Message-ID: <20210404140711.6daf3a6c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 29 Mar 2021 19:41:11 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - bump version to 3.17.0
> - adjust tool remove hooks according to the change to libexec
> - fix massive remove hook, ms_script vs. ms_print
> - add additional sha256 source package hash
> 
> For details see [1].
> 
> [1] https://www.valgrind.org/docs/manual/dist.news.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/valgrind/valgrind.hash |  4 +++-
>  package/valgrind/valgrind.mk   | 26 +++++++++++++-------------
>  2 files changed, 16 insertions(+), 14 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
