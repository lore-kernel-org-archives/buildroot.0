From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Dec 2020 09:28:15 +0100
Subject: [Buildroot] [PATCH 1/5] package/docker-containerd: fix version
 output ldflags
In-Reply-To: <20201216080013.547261-1-christian@paral.in>
References: <20201216080013.547261-1-christian@paral.in>
Message-ID: <20201230092815.60af83f7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Dec 2020 00:00:08 -0800
Christian Stewart <christian@paral.in> wrote:

> From: Tian Yuanhao <52117554+tianyuanhao@users.noreply.github.com>
> 
> Fix the ldflags specifying the version info for "version" command.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
> ---
>  package/docker-containerd/docker-containerd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
