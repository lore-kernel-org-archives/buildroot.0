From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Jan 2020 10:31:09 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/avro-c: depends on
 BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <20200102175135.155177-1-titouan.christophe@railnova.eu>
References: <20200102175135.155177-1-titouan.christophe@railnova.eu>
Message-ID: <20200108103109.678c3c1a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  2 Jan 2020 18:51:35 +0100
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> Fixes: http://autobuild.buildroot.net/results/989/989b4e8aaeff51bb5236c4b31e3783a0e07e4a82
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
> Changes v1->v2: Config.in comment also depends on ..SYNC_4
> ---
>  package/avro-c/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
