From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 20:19:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/postgresql: security bump
 version to 11.4
In-Reply-To: <20190622173050.14275-1-bernd.kuhls@t-online.de>
References: <20190622173050.14275-1-bernd.kuhls@t-online.de>
Message-ID: <20190622201949.799bb0ee@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 22 Jun 2019 19:30:50 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes: https://www.postgresql.org/docs/11/release-11-4.html
> 
> Fixes CVE-2019-10164.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/postgresql/postgresql.hash | 8 ++++----
>  package/postgresql/postgresql.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
