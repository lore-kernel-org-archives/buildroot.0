From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 23:25:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdvdread: fix build with
 gcc-4.8
In-Reply-To: <20200411123451.52419-1-bernd.kuhls@t-online.de>
References: <20200411123451.52419-1-bernd.kuhls@t-online.de>
Message-ID: <20200412232549.5a45290f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Apr 2020 14:34:51 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/28a/28a2e837eae1dae9214fab1aec119a9aa6b2e5c0/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libdvdread/libdvdread.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
