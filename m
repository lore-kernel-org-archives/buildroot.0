From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 11:09:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/go: bump to version 1.12.1
In-Reply-To: <20190317020142.743-1-christian@paral.in>
References: <20190317020142.743-1-christian@paral.in>
Message-ID: <20190317110938.2b5a9ce2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Mar 2019 19:01:42 -0700
Christian Stewart <christian@paral.in> wrote:

> Go 1.12 was released on 2/25/2019: https://blog.golang.org/go1.12
> 
> Go 1.12.1 was released on 3/14/2019:
> https://golang.org/doc/devel/release.html#go1.12.minor
> 
> Additional notes on how Go modules will evolve in 2019 are here:
> https://blog.golang.org/modules2019
> 
> In Go 1.12, module support remains the same as in Go 1.11. GOPATH is scheduled
> for deprecation in 1.13, however. The Buildroot Go package infrastructure should
> therefore aim to migrate to a new, currently undefined, Go module friendly
> compilation approach before Go 1.13 is released.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> package/go: bump to 1.12.1
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

There was a mistake here in the commit log, I fixed that up when applying.

> ---
>  package/go/go.hash | 2 +-
>  package/go/go.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
