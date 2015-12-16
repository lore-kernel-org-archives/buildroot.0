From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 09:36:41 +0100
Subject: [Buildroot] [PATCH] librsvg: needs host-gdk-pixbuf
In-Reply-To: <1450223026-23191-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450223026-23191-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151216093641.6abf0f7e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 15 Dec 2015 20:43:46 -0300, Gustavo Zacarias wrote:
> It's required for the gdk-pixbuf-query-loaders tool, to build the svg
> gdk-pixbuf module. Fixes:
> http://autobuild.buildroot.net/results/603/6031dbb937dadd04b6b9d1d77fc6106728502152/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/librsvg/librsvg.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
