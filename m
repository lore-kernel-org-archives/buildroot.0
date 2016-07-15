From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 19:33:47 +0200
Subject: [Buildroot] [v2 1/1] package/audit: Bump to version 2.6.5
In-Reply-To: <1468601363-12822-1-git-send-email-aduskett@codeblue.com>
References: <1468601363-12822-1-git-send-email-aduskett@codeblue.com>
Message-ID: <20160715193347.52032f2d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Jul 2016 12:49:23 -0400, Adam Duskett wrote:
> - Removed 0001-lib-gen_tables.c-define-EHWPOISON-when-not-available.patch
>   as this was applied upstream.
> 
> - Removed 0002-Fix-usage-of-audit_status.feature_bitmap.patch as this was
>   applied upstream.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>

When testing this patch, I get an invalid hash:

ERROR: audit-2.6.5.tar.gz has wrong sha256 hash:
ERROR: expected: a9c4bc0b95ffabc364f7de67ea694bab7045b120f396a2b149399a17138592bf
ERROR: got     : d99339a63fc6efaaee89efe7fa0e0c395f661392a4ae5056b2c9d10c67ca63a1
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Are you sure of the hash you calculated?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
