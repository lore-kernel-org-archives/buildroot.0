From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Mar 2020 23:19:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/polkit: fix build with NLS
In-Reply-To: <20200317210353.1260948-1-fontaine.fabrice@gmail.com>
References: <20200317210353.1260948-1-fontaine.fabrice@gmail.com>
Message-ID: <20200318231949.5046328d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 17 Mar 2020 22:03:53 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/258b734e14f8f31355eba1ddb734213bc3f29591
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/polkit/polkit.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
