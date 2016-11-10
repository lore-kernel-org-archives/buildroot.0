From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Nov 2016 11:52:02 +0100
Subject: [Buildroot] [git commit] board/atmel/readme.txt: remove mention
 of sama5d4ek
In-Reply-To: <20161110101929.m34erb7fxexyaegt@tarshish>
References: <20161110101717.C04A881D8B@busybox.osuosl.org>
 <20161110101929.m34erb7fxexyaegt@tarshish>
Message-ID: <20161110115202.16cb707c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Nov 2016 12:19:29 +0200, Baruch Siach wrote:

> On Thu, Nov 10, 2016 at 11:16:10AM +0100, Thomas Petazzoni wrote:
> > commit: https://git.buildroot.net/buildroot/commit/?id=78ac39cb89a6933c36508f6b10d30150ddb1ba05
> > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> > 
> > The sama5d4ek defconfig has been removed in commit
> > 9cb0b37cbd267ec1c2beea3deeaa86846bc2d037, but the board/atmel/readme.txt
> > file was not updated accordingly. This commit fixes that.
> > 
> > Reported-by: Baruch Siach <baruch@tkos.co.il>
> > Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  board/atmel/readme.txt                   |  1 -
> >  configs/atmel_sama5d4_xplained_defconfig | 32 --------------------------------  
> 
> This removal was not intended, I believe.

Raah, stupid git. When it applied the patch from Ludovic, the defconfig
no longer existed, so it matched with another very similar one. Stupid
thing. I'll fix this up, thanks for noticing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
