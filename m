From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 23:26:13 +0200
Subject: [Buildroot] [PATCH] weston: disable v4l simple dmabuf for
 headers < 3.8
In-Reply-To: <1461171283-14226-1-git-send-email-gustavo@zacarias.com.ar>
References: <1461171283-14226-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160421232613.38e98af5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Apr 2016 13:54:43 -0300, Gustavo Zacarias wrote:
> It uses VIDIOC_EXPBUF which only came to light with kernel 3.8, so
> disable it if headers are older. Fixes:
> http://autobuild.buildroot.net/results/7fb/7fb9968b13f144c4576b28ecd01c82b74e4ed9d5/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/weston/weston.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
