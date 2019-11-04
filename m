From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:01:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/lxc: bump to version 3.2.1
In-Reply-To: <20191104131237.27902-1-patrick.havelange@essensium.com>
References: <20191104131237.27902-1-patrick.havelange@essensium.com>
Message-ID: <20191104220147.6b9ac9c2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 Nov 2019 14:12:37 +0100
Patrick Havelange <patrick.havelange@essensium.com> wrote:

> Some lxc segfaults (in 3.1.0) are fixed in this newer version.
> New dependency on !UCLIBC as fexecve() is required now.
> 
> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
> ---
>  package/lxc/Config.in | 6 ++++--
>  package/lxc/lxc.hash  | 2 +-
>  package/lxc/lxc.mk    | 2 +-
>  3 files changed, 6 insertions(+), 4 deletions(-)

Applied to master, thanks. Could you report the bug to the upstream
uClibc-ng project that lxc can't be built/used anymore due to fexecve()
being missing ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
