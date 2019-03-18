From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 21:56:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-aiojobs: drop aiohttp
 dependency
In-Reply-To: <20190317220557.1359-1-james.hilliard1@gmail.com>
References: <20190317220557.1359-1-james.hilliard1@gmail.com>
Message-ID: <20190318215642.41598054@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Mar 2019 06:05:57 +0800
james.hilliard1 at gmail.com wrote:

> From: James Hilliard <james.hilliard1@gmail.com>
> 
> aiohttp isn't a required dependency for aiojobs
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-aiojobs/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
