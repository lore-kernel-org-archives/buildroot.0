From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Apr 2019 21:26:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/clang: fix build with gcc < 5.1
In-Reply-To: <20190415191401.12383-1-valentinkorenblit@gmail.com>
References: <20190415191401.12383-1-valentinkorenblit@gmail.com>
Message-ID: <20190415212600.4c0803b1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Apr 2019 21:14:01 +0200
Valentin Korenblit <valentinkorenblit@gmail.com> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/dc2302844a1d274e63da72023b6fd7be993f97b7
> 
> Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
> ---
>  package/clang/clang.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
