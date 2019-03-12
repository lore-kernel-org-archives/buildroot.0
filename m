From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 23:10:50 +0100
Subject: [Buildroot] [PATCH v4] package/zbar: bump version to 0.22
In-Reply-To: <20190309213235.30830-1-ps.report@gmx.net>
References: <20190309213235.30830-1-ps.report@gmx.net>
Message-ID: <20190312231050.60b7d928@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  9 Mar 2019 22:32:35 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - change from git download to official release and
>   download site (drop need for autoreconf)
> 
> - drop dependency on kernel headers >= 3.17 (should be fixed with
>   commit 'v4l2: make ZBar build and run on Kernels < 3.16' (see [1]),
>   fall back to original kernel headers >= 3.0 dependency propagated
>   from libv4l
> 
> [1] https://git.linuxtv.org/zbar.git/commit/?id=fa5c48127ec1e3670e28540c2e6a03431ebac5b8
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - rebased on current master

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
