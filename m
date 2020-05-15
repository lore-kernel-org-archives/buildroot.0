From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 May 2020 21:32:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to
 7.4.6
In-Reply-To: <20200514161909.672761-1-bernd.kuhls@t-online.de>
References: <20200514161909.672761-1-bernd.kuhls@t-online.de>
Message-ID: <20200515213238.033a973d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 14 May 2020 18:19:09 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Changelog: https://www.php.net/ChangeLog-7.php#7.4.6
> 
> Fixes CVE 2019-11048.
> 
> Reformatted hashes.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/php/php.hash | 4 ++--
>  package/php/php.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
