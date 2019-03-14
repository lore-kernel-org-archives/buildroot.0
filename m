From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 21:29:50 +0100
Subject: [Buildroot] [PATCH] libiio: bump to version 0.15
In-Reply-To: <20190313082932.13596-1-ardeleanalex@gmail.com>
References: <20190313082932.13596-1-ardeleanalex@gmail.com>
Message-ID: <20190314212950.70b4100e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Peter Korsgaard in Cc. Peter, there is some LTS related discussion
below.

On Wed, 13 Mar 2019 10:29:32 +0200
Alexandru Ardelean <ardeleanalex@gmail.com> wrote:

> This change bumps libiio, to version 0.15.
> This version is currently the most stable version in the series. It
> contains several fixes over 0.14.
> 
> 0.16 & 0.17 have been released but they have some issues with backwards
> compatibility, so they are not yet recommended.
> 
> Changelog for version 0.15 (over 0.14).
> Link:
>   https://github.com/analogdevicesinc/libiio/releases/tag/v0.15
> 
> Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>

Applied to master, thanks!

> 0.15 contains a fix that should also be added into the latest LTS.
> buildroot LTS contains version 0.14
> 
> Question:
>  - is it ok to port this change to the LTS (2019.02) ?
>  - do we cherry-pick the patches from 0.15 to put on top of 0.14 ?
> 
> The important patches would be ~12.
> The really important patches would be fewer (needs more digging into).
> 
> How do patches for LTS versions get marked/sent ?
> (Or how is the protocol for sending patches to LTS; I haven't found
> anything yet to suggest how to do it).

I had a look at
https://github.com/analogdevicesinc/libiio/releases/tag/v0.15, and it
looks like between 0.14 and 0.15, the number of commits is fairly
limited, and the vast majority of them are fixes. So I believe it
should be OK to directly take this bump to 0.15 in the LTS release.

Peter, do you agree ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
