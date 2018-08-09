From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 00:03:07 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/libva: bump version to 2.2.0
In-Reply-To: <20180729192528.5819-1-bernd.kuhls@t-online.de>
References: <20180729192528.5819-1-bernd.kuhls@t-online.de>
Message-ID: <20180810000307.5bd402ac@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Jul 2018 21:25:26 +0200, Bernd Kuhls wrote:
> Upstream moved its github repo to github.com/intel/, updated URLs, for
> reference see upstream PR 198. Also updated project URL.
> 
> Added patch to fix build without stack-protector support.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: added configure check for -fstack-protector (Thomas)

Entire series applied to next! Thanks for having worked on
upstream-acceptable patches. I see it has already been merged in libva
(I haven't checked libva-intel and libva-utils though).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
