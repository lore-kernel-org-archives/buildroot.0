From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Aug 2019 23:59:58 +0200
Subject: [Buildroot] [PATCH 1/4] package/dahdi-linux: bump to version
 3.0.0
In-Reply-To: <20190814175546.14670-1-fontaine.fabrice@gmail.com>
References: <20190814175546.14670-1-fontaine.fabrice@gmail.com>
Message-ID: <20190817235958.2f830050@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Wed, 14 Aug 2019 19:55:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix build with kernel >= 4.13 thanks to
> https://github.com/asterisk/dahdi-linux/commit/d4e232a776ee27eb04aed3cbd72a203118dbe9f1
> 
> Fixes:
>  - https://bugs.buildroot.org/show_bug.cgi?id=11921
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dahdi-linux/dahdi-linux.hash | 4 ++--
>  package/dahdi-linux/dahdi-linux.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Series applied to master. I've applied to master because it fixes two
bugs, and will not cause any new autobuilder failures, since none of
these packages are tested by the autobuilders currently.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
