From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 14:49:24 +0200
Subject: [Buildroot] [PATCH 1/1] botan: fix build on arm without neon
In-Reply-To: <20180907191736.19192-1-fontaine.fabrice@gmail.com>
References: <20180907191736.19192-1-fontaine.fabrice@gmail.com>
Message-ID: <20180908144924.7ba70ca3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  7 Sep 2018 21:17:36 +0200, Fabrice Fontaine wrote:
> configure.py only supports --disable-neon
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/26eec7e20795068613616a7312681853232ec764
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/botan/botan.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
