From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 May 2019 09:06:33 +0200
Subject: [Buildroot] [PATCH v2] package/exiv2: cleanup options and
 licenses
In-Reply-To: <2ae7ca95-3cca-4be4-3aee-96eb194124d8@mind.be>
References: <20190508103129.100751-1-nicolas.serafini@sensefly.com>
 <20190526223638.43122149@windsurf>
 <2ae7ca95-3cca-4be4-3aee-96eb194124d8@mind.be>
Message-ID: <20190527090633.36b30cb6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 May 2019 23:50:15 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > And if there's a reason for it, why is it done as part of the patch
> > dropping the _COMMERCIAL option ?  
> 
>  This was discussed in v1 of the patch (and indeed should have been part of the
> commit log).
> 
> The BR2_PACKAGE_EXIV2_LENSDATA option only existed as a separate option because
> of hte license concerns (incompatibility with the commercial license). Since
> these concerns have gone away, and the license database is only 80KB, remove
> this option as well.
> 
>  It could have been done in a separate patch, but since anyway the help text
> would have to change in this patch, I think it's not worth splitting off.

Thanks for the additional explanation. It should have been part of the
commit log indeed.

What do we do now? Nicolas, do you submit a v3 with an improved commit
log? Do we resurrect v2 from patchwork, and adjust the commit log when
applying?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
