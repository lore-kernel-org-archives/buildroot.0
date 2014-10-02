From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Oct 2014 12:18:10 +0200
Subject: [Buildroot] [PATCH 1/3] ffmpeg: fix license file
In-Reply-To: <1412244663-23868-1-git-send-email-luca@lucaceresoli.net>
References: <1412244663-23868-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20141002121810.32013567@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Thu,  2 Oct 2014 12:11:01 +0200, Luca Ceresoli wrote:
> Somewhere between 1.2.7 and 2.3.1 (version bump in bf76f4319131a107)
> the LICENSE file has been renamed to LICENSE.md, so `make legal-info`
> is currently broken. Update to the current file name.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  package/ffmpeg/ffmpeg.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

All three patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
