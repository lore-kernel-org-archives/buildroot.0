From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 21:47:39 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/git: bump version to 2.30.2
In-Reply-To: <20210318201655.32647-1-ps.report@gmx.net>
References: <20210318201655.32647-1-ps.report@gmx.net>
Message-ID: <20210320214739.14cf9cf5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Mar 2021 21:16:54 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Fix CVE-2021-21300:
> 
>   On case-insensitive file systems with support for symbolic links,
>   if Git is configured globally to apply delay-capable clean/smudge
>   filters (such as Git LFS), Git could be fooled into running
>   remote code during a clone.
> 
> For details see [1] and [2].
> 
> [1] http://lkml.iu.edu/hypermail/linux/kernel/2102.1/01858.html
> [2] http://lkml.iu.edu/hypermail/linux/kernel/2103.1/02533.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/git/git.hash | 2 +-
>  package/git/git.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
