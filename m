From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Oct 2019 09:21:56 +0200
Subject: [Buildroot] [PATCH] package/sudo: security bump to version
 1.8.28
In-Reply-To: <2706c5c37be3187c1e6505441c2fba2767b33f15.1571122747.git.baruch@tkos.co.il>
References: <2706c5c37be3187c1e6505441c2fba2767b33f15.1571122747.git.baruch@tkos.co.il>
Message-ID: <20191015092156.67419118@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Oct 2019 09:59:07 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Fixes CVE-2019-14287: a sudo user may be able to run a command as root
> when the Runas specification explicitly disallows root access as long as
> the ALL keyword is listed first.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/sudo/sudo.hash | 2 +-
>  package/sudo/sudo.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
