From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 15:42:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Fix ranlib check when
 cross-compiling
In-Reply-To: <1429215155-2085-2-git-send-email-bernd.kuhls@t-online.de>
References: <1429215155-2085-1-git-send-email-bernd.kuhls@t-online.de>
 <1429215155-2085-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150418154206.14852046@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu, 16 Apr 2015 22:12:35 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/d13/d13488a43f6e034623104a36c07114db99325b8d/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ffmpeg/0016-ranlib.patch |   35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/ffmpeg/0016-ranlib.patch

I've applied this patch. Please submit it upstream, and give us some
feedback on upstream's reaction. One thing I'm wondering is whether
with your patch, the --ranlib= option continues to work.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
