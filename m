From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Apr 2017 18:14:24 +0200
Subject: [Buildroot] [RFC 4/4] board/acmesystems/aria-g25: set
 BR2_GENIMAGE_CFG_FILES
In-Reply-To: <02a1a330-c947-2a64-29bb-88f6ac7d9c9f@mind.be>
References: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
 <20170329145120.11863-5-etienne.phelip@savoirfairelinux.com>
 <ccc877c5-1ea5-e2d6-1739-c913f4d6d0a7@mind.be>
 <20170401155116.66464885@free-electrons.com>
 <8760ilvozx.fsf@dell.be.48ers.dk>
 <2ce8812c-d95e-bd4a-9cde-f02ab8e3ca60@mind.be>
 <87wpazuaa1.fsf@dell.be.48ers.dk>
 <02a1a330-c947-2a64-29bb-88f6ac7d9c9f@mind.be>
Message-ID: <20170405181424.1d69fee5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 5 Apr 2017 17:02:36 +0200, Arnout Vandecappelle wrote:

>  Combined with the other discussion in this thread, long-term I see us evolving
> towards:
> 
> - deprecate some of the finer-grain fs tuning options we have now;
> - always using genimage to generate the target filesystems;
> - position our fs targets more as a 'quick fix' solution than for production;
> - make host-e2fsprogs etc. blind options again.

To be honest, I am not sure I share this long-term view. I like the way
things are done today, very modular: we can generate just a filesystem
image, optionally use genimage afterwards, etc. So the "always using
genimage to generate the target filesystem" is not something that I see
as an improvement, for example.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
