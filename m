From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 21:54:46 +0100
Subject: [Buildroot] [PATCH next] strace: bump to version 4.25
In-Reply-To: <daeb6e28d7b1375a361162c2e4b9daf001afcd03.1543313865.git.baruch@tkos.co.il>
References: <daeb6e28d7b1375a361162c2e4b9daf001afcd03.1543313865.git.baruch@tkos.co.il>
Message-ID: <20181128215446.1ac5577a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Nov 2018 12:17:45 +0200, Baruch Siach wrote:
> This release also fixes compatibility with kernel 4.19 headers.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0763988c35a1de7d51c7094b5b002ed369f1a25f/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/strace/strace.hash | 4 ++--
>  package/strace/strace.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
