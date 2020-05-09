From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 21:51:30 +0200
Subject: [Buildroot] [PATCH] package/netsniff-ng: bump to version 0.6.7
In-Reply-To: <20200505041119.632318-1-vadim4j@gmail.com>
References: <20200505041119.632318-1-vadim4j@gmail.com>
Message-ID: <20200509215130.67db3ae2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 May 2020 07:11:19 +0300
Vadim Kochan <vadim4j@gmail.com> wrote:

> From: Vadym Kochan <vadim4j@gmail.com>
> 
> 1. trafgen: reset errno before calling sscanf in str2mac (@troglobit, #213)
> 2. ifpps: fix iface stat parsing if interface name contains uppercase
>    characters (@bganne, #215)
> 3. mausezahn: fix display of missing argument error (@micrictor, #217)
> 4. mausezahn: support -R to set packet priority (@pmachata)
> 5. netsniff-ng: handle various malformed packets in protocol dissectors
>    (@nathaniellives, #221)
> 
> Signed-off-by: Vadym Kochan <vadim4j@gmail.com>
> ---
>  package/netsniff-ng/netsniff-ng.hash | 2 +-
>  package/netsniff-ng/netsniff-ng.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Normally we don't take version bumps in master, but seems like this
minor version bump only includes bug fixes, so I applied to master.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
