From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Feb 2019 08:24:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/go: bump to version 1.12
In-Reply-To: <20190226034554.24429-1-christian@paral.in>
References: <20190226034554.24429-1-christian@paral.in>
Message-ID: <20190226082449.040c7a2a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

Thanks for your patch.

On Mon, 25 Feb 2019 19:45:54 -0800
Christian Stewart <christian@paral.in> wrote:

> Go 1.12 was released on 2/25/2019: https://blog.golang.org/go1.12
> 
> Additional notes on how Go modules will evolve in 2019 are here:
> https://blog.golang.org/modules2019
> 
> In Go 1.12, module support remains the same as in Go 1.11. GOPATH is scheduled
> for deprecation in 1.13, however. The Buildroot Go package infrastructure should
> therefore aim to migrate to a new, currently undefined, Go module friendly
> compilation approach before Go 1.13 is released.

I am puzzled by your statement "currently undefined". Is it undefined
in the sense "it is not defined yet how Buildroot will handle this" or
"it is not defined in Go yet how the module compilation will work in
1.13" ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
