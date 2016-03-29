From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 00:01:31 +0200
Subject: [Buildroot] [PATCH 2/2] package/freerdp: add support for ffmpeg
 3.0
In-Reply-To: <1459283439-30933-2-git-send-email-bernd.kuhls@t-online.de>
References: <1459283439-30933-1-git-send-email-bernd.kuhls@t-online.de>
 <1459283439-30933-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160330000131.76925ae0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Mar 2016 22:30:39 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/freerdp/0004-ffmpeg30.patch | 74 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 package/freerdp/0004-ffmpeg30.patch

Could you instead take this patch and resend it as part of the next
ffmpeg 3.x series ?

We still need to solve the VLC issue before we can bump to ffmpeg 3.x.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
