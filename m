From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 18:49:15 +0200
Subject: [Buildroot] [PATCH 1/1] znc: add mandatory dependency on threads
In-Reply-To: <20180520161656.30997-1-fontaine.fabrice@gmail.com>
References: <20180520161656.30997-1-fontaine.fabrice@gmail.com>
Message-ID: <20180520184915.206a5c77@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 May 2018 18:16:56 +0200, Fabrice Fontaine wrote:
> Threads support is mandatory since version 1.7.0:
> https://github.com/znc/znc/commit/582cd635f5a047761b1052a40088ab86e62fffc1
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/cc56c7dbee594056288296398772ef9e22846299
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/znc/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
