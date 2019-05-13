From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 May 2019 20:53:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/sqlite: security bump version
 to 3.28.0
In-Reply-To: <20190513162236.18404-1-bernd.kuhls@t-online.de>
References: <20190513162236.18404-1-bernd.kuhls@t-online.de>
Message-ID: <20190513205311.7d083dab@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 May 2019 18:22:36 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes: https://www.sqlite.org/releaselog/3_28_0.html
> 
> Fixes https://nvd.nist.gov/vuln/detail/CVE-2019-5018
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/sqlite/sqlite.hash | 4 ++--
>  package/sqlite/sqlite.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
