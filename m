From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 18:54:39 +0100
Subject: [Buildroot] [PATCH v3 1/7] package/nodejs: bump version to 5.3.0
In-Reply-To: <1450872968-5834-1-git-send-email-martin@barkynet.com>
References: <1450872968-5834-1-git-send-email-martin@barkynet.com>
Message-ID: <20151223185439.4fd76a3e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Wed, 23 Dec 2015 12:16:02 +0000, Martin Bark wrote:
> Replace 4.2.3 with 5.3.0.  5.3.0 is the current Stable release. See
> https://nodejs.org/en/blog/release/v5.3.0 for details on the release.
> 
> Copied 4.2.3 patched to 5.3.0 with the following exceptions:
>  - Removed 0004-fix-arm-vfpv2.patch, committed upstream and included in
>    5.3.0.  See https://github.com/nodejs/node/commit/84dea1bd0c
>  - Added 0004-Fix-va_list-not-declared.patch, fix for a new bug.  This
>    has already been fixed upstream but is not in 5.3.0
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>

I've applied patches 1, 2, 3, 4, 6 and 7. I've left out patch 5 because
I have some concerns about it. I'll reply to patch 5 with some details.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
