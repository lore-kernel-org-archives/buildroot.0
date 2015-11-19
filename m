From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Nov 2015 23:06:44 +0100
Subject: [Buildroot] [PATCH v2] pkg-download: support 'file://' in
 BR2_PRIMARY_SITE
In-Reply-To: <1447837405-25846-1-git-send-email-jezz@sysmic.org>
References: <1447837405-25846-1-git-send-email-jezz@sysmic.org>
Message-ID: <20151119230644.4d8a4192@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Wed, 18 Nov 2015 10:03:25 +0100, J?r?me Pouiller wrote:
> This feature was already discuted here:
> 
>   http://lists.busybox.net/pipermail/buildroot/2015-April/125419.html
> 
> Personally, I have a big central directory with all tarballs I have
> ever downloaded. I use this feature to isolate tarballs necessary to
> build a configuration:
> 
>   make project_defconfig
>   make BR2_DL_DIR=/tmp/mirror-project BR2_PRIMARY_SITE=file:///home/user/dl source
>   tar -C /tmp -czvf mirror-project.tgz mirror-project
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
> v2:
>  - Update help message

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
