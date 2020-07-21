From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Jul 2020 09:41:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3: security bump version
 to 3.8.5
In-Reply-To: <20200720191703.46515-1-bernd.kuhls@t-online.de>
References: <20200720191703.46515-1-bernd.kuhls@t-online.de>
Message-ID: <20200721094125.4e0494da@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Jul 2020 21:17:03 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes CVE-2020-15801 & CVE-2019-20907.
> 
> Changelog:
> https://docs.python.org/release/3.8.5/whatsnew/changelog.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/python3/python3.hash | 6 +++---
>  package/python3/python3.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
