From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Jan 2021 23:30:39 +0100
Subject: [Buildroot] [PATCH 05/10 v3] WIP: boot+packages: update hash to
 new git-tarballs format
In-Reply-To: <29b653935ed3ec38f7e0bb05445be7e99473aa5d.1609239666.git.yann.morin.1998@free.fr>
References: <cover.1609239666.git.yann.morin.1998@free.fr>
 <29b653935ed3ec38f7e0bb05445be7e99473aa5d.1609239666.git.yann.morin.1998@free.fr>
Message-ID: <b976af57-7237-cd64-c57b-b83d32dcaa36@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/12/2020 12:01, Yann E. MORIN wrote:
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

 Did you use a script to (partially) generate this? If yes, it would be nice to
include it in the commit message.

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 I've only visually inspected this, I haven't checked if there are any packages
that were missed. But as discussed orally: the autobuilders will catch those.

 Regards,
 Arnout


[snip]
