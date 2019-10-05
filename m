From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 23:34:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/rpcbind: fix rpcbind path
In-Reply-To: <20191003144504.47060-1-james.hilliard1@gmail.com>
References: <20191003144504.47060-1-james.hilliard1@gmail.com>
Message-ID: <20191005233447.74371aa8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  3 Oct 2019 08:45:04 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Per upstream commit 9afccfcd5ab350d6bc72622f3d1ccfb9e54652b0
> https://git.linux-nfs.org/?p=steved/rpcbind.git;a=commit;h=9afccfcd5ab350d6bc72622f3d1ccfb9e54652b0
> 
> The rpcbind binary was moved from bin to sbin.
> 
> As such we must update the path in our service/init files.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/rpcbind/S30rpcbind      | 2 +-
>  package/rpcbind/rpcbind.service | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
