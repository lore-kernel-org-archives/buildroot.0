From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:15:22 +0100
Subject: [Buildroot] [PATCH] package/zstd: build multithreaded host-zstd
In-Reply-To: <20210118203753.30241-1-patrickdepinguin@gmail.com>
References: <20210118203753.30241-1-patrickdepinguin@gmail.com>
Message-ID: <20210118221522.2efd2ffc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Jan 2021 21:37:52 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Under the assumption that all Buildroot build hosts nowadays are
> multithreaded, we can boost performance of host-zstd by enabling
> multithreaded operation.
> 
> See also commit 52154e52069d20105f62191e6c9f903f188a5129.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/zstd/zstd.mk | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
