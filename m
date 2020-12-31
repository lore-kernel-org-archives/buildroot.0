From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Dec 2020 14:45:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/tini: install docker-init
 symlink
In-Reply-To: <20201223033501.1890640-1-tianyuanhao@aliyun.com>
References: <20201223033501.1890640-1-tianyuanhao@aliyun.com>
Message-ID: <20201231144528.729e0334@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Dec 2020 11:35:01 +0800
Tian Yuanhao via buildroot <buildroot@busybox.net> wrote:

> From: Christian Stewart <christian@paral.in>
> 
> This removes the warning that docker can't find docker-init in PATH.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
> ---
>  package/tini/tini.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
