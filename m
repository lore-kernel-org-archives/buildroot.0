From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 23:23:17 +0200
Subject: [Buildroot] [PATCH] package/nodejs: install to staging
In-Reply-To: <20200608103210.23757-1-yegorslists@googlemail.com>
References: <20200608103210.23757-1-yegorslists@googlemail.com>
Message-ID: <20200610232317.6ff56dcb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  8 Jun 2020 12:32:10 +0200
yegorslists at googlemail.com wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Install header files and libraries into the staging area. Some
> packages like mraa (if enabled for Node.js) search for node.h
> and v8.h. Hence, Node.js development file must be installed to
> the staging area.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/nodejs/nodejs.mk | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
