From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Sep 2020 09:48:19 +0200
Subject: [Buildroot] [PATCH next] package/uhubctl: bump to version 2.2.0
In-Reply-To: <73c54402e688998f5a2a811cb3613a41bc164302.1590640751.git.baruch@tkos.co.il>
References: <73c54402e688998f5a2a811cb3613a41bc164302.1590640751.git.baruch@tkos.co.il>
Message-ID: <20200908094819.32822d2a@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 May 2020 07:39:11 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Force GIT_VERSION to avoid git version logic that takes the Buildroot
> git commit id.
> 
> Update LICENSE hash; copyright year update.
> 
> Format hashes file with two space delimiters.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/uhubctl/uhubctl.hash | 4 ++--
>  package/uhubctl/uhubctl.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
