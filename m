From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 16:35:29 +0200
Subject: [Buildroot] [PATCH v2] ser2net: bump to 2.9
In-Reply-To: <1375013588-2666-1-git-send-email-yegorslists@googlemail.com>
References: <1375013588-2666-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20130728163529.475e194a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Sun, 28 Jul 2013 14:13:08 +0200, Yegor Yefremov wrote:

> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes since v1: added reason for autoreconf
> 
>  package/ser2net/ser2net.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks. As suggested by Baruch, I've added a comment inside
the .mk file itself for the autoreconf line.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
