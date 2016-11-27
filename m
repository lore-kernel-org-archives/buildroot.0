From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 22:23:56 +0100
Subject: [Buildroot] [PATCH] imagemagick: security bump to 7.0.3-8
In-Reply-To: <20161127211133.18966-1-peter@korsgaard.com>
References: <20161127211133.18966-1-peter@korsgaard.com>
Message-ID: <20161127222356.0cbe287b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Nov 2016 22:11:33 +0100, Peter Korsgaard wrote:
> Fixes CVE-2016-9556 (Heap buffer overflow in IsPixelGray).
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/imagemagick/imagemagick.hash | 2 +-
>  package/imagemagick/imagemagick.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
