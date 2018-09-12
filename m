From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 21:33:12 +0200
Subject: [Buildroot] [PATCH] support/mkusers: Preserve group members
In-Reply-To: <20180903131116.5404-1-johan.oudinet@gmail.com>
References: <20180903131116.5404-1-johan.oudinet@gmail.com>
Message-ID: <20180912213312.37fac55b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Sep 2018 15:11:16 +0200, Johan Oudinet wrote:
> When the function add_one_group is called on an existing group,
> make sure the members of this group are not removed in the process of
> deleting then re-adding the group.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  support/scripts/mkusers | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

Applied to master after referencing the ${members} variable using curly
braces, as suggested by Yann.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
