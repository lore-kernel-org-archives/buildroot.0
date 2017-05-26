From: Christian Stewart <christian@paral.in>
Date: Thu, 25 May 2017 17:18:52 -0700
Subject: [Buildroot] [PATCH/next 1/1] package/docker-containerd: bump
	version to v0.2.8
In-Reply-To: <20170525224557.4601-1-bernd.kuhls@t-online.de>
References: <20170525224557.4601-1-bernd.kuhls@t-online.de>
Message-ID: <CA+h8R2pK5eT16OdPcQM=e1yggAfgfKxThuK5Rebz9oKnF1GcHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On Thu, May 25, 2017 at 3:45 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> -DOCKER_CONTAINERD_VERSION = 422e31ce907fd9c3833a38d7b8fdd023e5a76e73
> +DOCKER_CONTAINERD_VERSION = v0.2.8

I would not recommend bumping containerd without updating Docker as
well... They should be updated in sync.

How is this different from this series?

 - https://patchwork.ozlabs.org/patch/760409/

Also, we need a decision on this series:

 - https://patchwork.ozlabs.org/patch/760395/

Thanks!
Christian Stewart
