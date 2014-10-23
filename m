From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Oct 2014 09:50:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/cdrkit: standardize site URL
In-Reply-To: <5447DF1F.3040100@mind.be>
References: <1413983659-3496-1-git-send-email-kaszak@gmail.com>
 <20141022152231.1ecdf27a@free-electrons.com>
 <5447DF1F.3040100@mind.be>
Message-ID: <20141023095030.5bc53eba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 22 Oct 2014 18:45:19 +0200, Arnout Vandecappelle wrote:

>  We've discussed this before and IIRC nobody was against getting rid of
> BR2_DEBIAN_MIRROR. Well, looking back through my mail archives, it looks like
> you (Thomas) said a couple of times to use snapshot instead of BR2_DEBIAN_MIRROR
> and nobody objected.
> 
>  I certainly agree that using snapshot is a better idea. We now have a mix of 17
> packages using BR2_DEBIAN_MIRROR and 10 packages using snapshot.debian.org, and
> AFAIK we never had any problem with the snapshot packages.

I agree. So Karoly, feel free to work on a patch series moving all
packages fetching their source code from Debian to use
snapshot.debian.org, and then removing BR2_DEBIAN_MIRROR.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
