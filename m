From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Jan 2020 09:17:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/go: bump to 1.13.6
In-Reply-To: <20200110044551.1912203-1-christian@paral.in>
References: <20200110044551.1912203-1-christian@paral.in>
Message-ID: <20200110091749.6bdc279c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

On Thu,  9 Jan 2020 20:45:51 -0800
Christian Stewart <christian@paral.in> wrote:

> go1.13.6 (released 2020/01/09) includes fixes to the runtime and the net/http
> package.
> 
> https://github.com/golang/go/issues?q=milestone=Go1.13.6
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Since you're bumping Go, I was wondering what is the status of the "Go
module" support, that you started a while ago ? This was not a simple
topic, but I think this is something we can to get into Buildroot at
some point.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
