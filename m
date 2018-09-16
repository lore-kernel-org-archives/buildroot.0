From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 15:54:04 +0200
Subject: [Buildroot] [PATCH 1/1] botan: fix static build
In-Reply-To: <20180916094955.1989-1-fontaine.fabrice@gmail.com>
References: <20180916094955.1989-1-fontaine.fabrice@gmail.com>
Message-ID: <20180916155404.5b647788@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Sep 2018 11:49:55 +0200, Fabrice Fontaine wrote:
> Don't pass crs in AR as it is now done by botan, see:
> https://github.com/randombit/botan/commit/a9e4eede3942748234d705cc616ecc106e3767a6
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/5c15fe739cb1b6079dacf234699ee048924b74fb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/botan/botan.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
