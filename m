From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 14:31:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/acsccid: needs iconv
In-Reply-To: <20191030053750.4971-1-bernd.kuhls@t-online.de>
References: <20191030053750.4971-1-bernd.kuhls@t-online.de>
Message-ID: <20191208143150.7d68c04f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 30 Oct 2019 06:37:50 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Upstream commit
> https://github.com/acshk/acsccid/commit/5672d821ba96deb6c0c11060e4de0c9dab9b21c7
> added "include <iconv.h>"
> 
> Fixes:
> http://autobuild.buildroot.net/results/04e/04eac264718a47c550bb48b3c36314751fb4de91/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/acsccid/Config.in  | 1 +
>  package/acsccid/acsccid.mk | 4 ++++
>  2 files changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
