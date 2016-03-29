From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 23:58:06 +0200
Subject: [Buildroot] [PATCH 1/2] Revert "package/freerdp: bump version"
In-Reply-To: <1459283439-30933-1-git-send-email-bernd.kuhls@t-online.de>
References: <1459283439-30933-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160329235806.6645ec98@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Mar 2016 22:30:38 +0200, Bernd Kuhls wrote:
> This reverts commit dda26dc614b6f5ef9be67d2604bac39235322235.
> 
> Instead of bumping freerdp to a version which breaks gstreamer
> detection we revert the latest bump for now.
> 
> Fixes
> http://autobuild.buildroot.net/results/1ab/1abc713a58d21c71678aab9b21ac1cfac23684f5/
> http://autobuild.buildroot.net/results/0ef/0efd39115a631c409eb809b38ab64604d1de99ca/
> http://autobuild.buildroot.net/results/7aa/7aac3f970dd1fbc0d25f268f32844bec7e49f4af/
> http://autobuild.buildroot.net/results/396/396401bd6eb5f95364a32456a274da185e081541/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/freerdp/freerdp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
