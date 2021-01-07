From: Vincent Fazio <vfazio@xes-inc.com>
Date: Thu, 7 Jan 2021 13:47:25 -0600
Subject: [Buildroot] [PATCH 05/10 v3] WIP: boot+packages: update hash to
 new git-tarballs format
In-Reply-To: <29b653935ed3ec38f7e0bb05445be7e99473aa5d.1609239666.git.yann.morin.1998@free.fr>
References: <cover.1609239666.git.yann.morin.1998@free.fr>
 <29b653935ed3ec38f7e0bb05445be7e99473aa5d.1609239666.git.yann.morin.1998@free.fr>
Message-ID: <356c10e5-913c-6e39-77f6-709711a3810c@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/29/20 5:01 AM, Yann E. MORIN wrote:
> ** WIP: should be squashed with the commit that updates the git backend
> 
> Of all the bootloaders that have a git download method, vexpress-firmware
> is the only one to have a hash. Others have no hash files, or they have
> explicitly set BR_NO_CHECK_HASH_FOR.
> 
> For the packages, linux-headers is the special snowflake, as the git
> download is only for custom git tree, so it is excluded from the hash
> verification with BR_NO_CHECK_HASH_FOR.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Vincent Fazio <vfazio@xes-inc.com>

Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>

-- 
Vincent Fazio
Embedded Software Engineer - Linux
Extreme Engineering Solutions, Inc
http://www.xes-inc.com
