From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:51:16 +0200
Subject: [Buildroot] [RFC 4/4] board/acmesystems/aria-g25: set
 BR2_GENIMAGE_CFG_FILES
In-Reply-To: <ccc877c5-1ea5-e2d6-1739-c913f4d6d0a7@mind.be>
References: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
 <20170329145120.11863-5-etienne.phelip@savoirfairelinux.com>
 <ccc877c5-1ea5-e2d6-1739-c913f4d6d0a7@mind.be>
Message-ID: <20170401155116.66464885@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Mar 2017 00:51:08 +0200, Arnout Vandecappelle wrote:

>  I'm still not entirely sure if this new option is worthwhile. Without it, you
> would instead need
> 
> BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> BR2_ROOTFS_POST_SCRIPT_ARGS="board/acmesystems/aria-g25/genimage.cfg"
> 
> Not really complicated either... The only real advantage I see is that it
> motivates people more to use genimage (which is otherwise a bit hidden). But for
> that, a paragraph or two in docs/manual/customize-post-image.txt would also
> work. By the way, even for this series an explanation of the option would be
> required in that file.
> 
>  What do the others think?

I agree that the new option doesn't seem really useful.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
