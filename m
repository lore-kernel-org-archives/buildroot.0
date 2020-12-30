From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Dec 2020 09:32:15 +0100
Subject: [Buildroot] [PATCH 3/5] package/docker-containerd: specify
 correct build targets
In-Reply-To: <20201216080013.547261-3-christian@paral.in>
References: <20201216080013.547261-1-christian@paral.in>
 <20201216080013.547261-3-christian@paral.in>
Message-ID: <20201230093215.652ca080@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Dec 2020 00:00:10 -0800
Christian Stewart <christian@paral.in> wrote:

> Adds build targets "ctr" cli and runc shims.

ctr was already in the list of build targets:

-DOCKER_CONTAINERD_BUILD_TARGETS = cmd/ctr cmd/containerd cmd/containerd-shim

So I've amended the commit log, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
