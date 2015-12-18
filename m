From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 22:26:29 +0100
Subject: [Buildroot] [PATCH v2 2/3] python-backports-abc: new package
In-Reply-To: <1450251372-7064-2-git-send-email-yegorslists@googlemail.com>
References: <1450251372-7064-1-git-send-email-yegorslists@googlemail.com>
 <1450251372-7064-2-git-send-email-yegorslists@googlemail.com>
Message-ID: <20151218222629.1c210d8a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Dec 2015 08:36:11 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> A backport of recent additions to the 'collections.abc' module.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes:
> 	v2: make the patch a part of the Tornado update series

I've applied. However, it is not really great that the package doesn't
carry any license information. The PKG-INFO file even says that the
license is "UNKNOWN". Can you talk with upstream so that they clarify
the license of this package (which obviously must be the same license
as Python itself, but it is better if it's clearly said).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
