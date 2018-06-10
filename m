From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 14:14:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpg123: security bump to
 version 1.25.10
In-Reply-To: <20180610120910.17574-1-bernd.kuhls@t-online.de>
References: <20180610120910.17574-1-bernd.kuhls@t-online.de>
Message-ID: <20180610141450.3f650291@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Jun 2018 14:09:10 +0200, Bernd Kuhls wrote:
> Version 1.25.4 fixes CVE-2017-9545, for details see release notes:
> http://www.mpg123.org/cgi-bin/news.cgi
> 
> Added upstream hashes.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mpg123/mpg123.hash | 8 +++++---
>  package/mpg123/mpg123.mk   | 2 +-
>  2 files changed, 6 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
