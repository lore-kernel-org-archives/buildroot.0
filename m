From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 15:19:22 +0200
Subject: [Buildroot] [PATCH] make: Correct hash type
In-Reply-To: <1464959760-65290-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1464959760-65290-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20160603151922.3adb57af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Jun 2016 08:16:00 -0500, Clayton Shotwell wrote:
> The hash published in the make release emails is a md5sum, not a
> sha1sum. Locally verified the downloaded file checks against the md5sum
> after verifying the signature
> 
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> ---
>  package/make/make.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, but this issue has already been fixed in
https://git.buildroot.net/buildroot/commit/?id=3aa3b892aba1169618075c9d55af3d57ad59092b.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
