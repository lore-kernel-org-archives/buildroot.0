From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 21:00:04 +0200
Subject: [Buildroot] [PATCH 1/1] libv4l: qv4l2 doesn't support GLES
In-Reply-To: <20180319105531.34918-1-phil@zankapfel.net>
References: <20180319105531.34918-1-phil@zankapfel.net>
Message-ID: <20181020210004.24b7028d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Mar 2018 11:55:31 +0100, Phil Eichinger wrote:
> qv4l2 explicitly sets QT_NO_OPENGL_ES_2 because GLES is not supported
> yet. So compiling with Qt5 which has only GLES enabled fails.
> 
> https://git.linuxtv.org/v4l-utils.git/commit/utils/qv4l2?id=c185420d494d8985ec3aab6b2a28f858046052b5
> Signed-off-by: Phil Eichinger <phil@zankapfel.net>
> ---
>  package/libv4l/libv4l.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Following the feedback from Peter Seiderer, I've marked this patch as
Rejected in patchwork. We also don't have build failures that match
this issue it seems.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
