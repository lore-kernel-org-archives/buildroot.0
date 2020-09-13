From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 15:55:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/go: bump to 1.15.2
In-Reply-To: <20200912234935.137556-1-christian@paral.in>
References: <20200912234935.137556-1-christian@paral.in>
Message-ID: <20200913155511.1b8fc809@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 12 Sep 2020 16:49:35 -0700
Christian Stewart <christian@paral.in> wrote:

> go1.15.2 (released 2020/09/09) includes fixes to the compiler, runtime,
> documentation, the go command, and the net/mail, os, sync, and testing packages.
> 
> https://golang.org/doc/devel/release.html#go1.15
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
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
