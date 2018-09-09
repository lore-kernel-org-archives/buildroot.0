From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:14:07 +0200
Subject: [Buildroot] [PATCH 1/1] glibc: fix hash for LICENSES
In-Reply-To: <20180909095302.2697-1-fontaine.fabrice@gmail.com>
References: <20180909095302.2697-1-fontaine.fabrice@gmail.com>
Message-ID: <20180909151407.02ddce45@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Sep 2018 11:53:02 +0200, Fabrice Fontaine wrote:
> When bumping to 2.28, LICENSES file changed to remove the
> stdio-common/tst-printf.c part:
> https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=5a357506659f9a00fcf5bc9c5d8fc676175c89a7
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/72824137037f675e4efe3284089451803f944abf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/glibc/glibc.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
