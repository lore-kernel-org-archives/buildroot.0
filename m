From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Apr 2020 22:46:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/stellarium: bump version to
 0.20.0
In-Reply-To: <20200410074801.783932-1-bernd.kuhls@t-online.de>
References: <20200410074801.783932-1-bernd.kuhls@t-online.de>
Message-ID: <20200410224637.4e1c96b5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Apr 2020 09:48:01 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Added upstream commit to fix build error.
> Switched to sha256 hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...uilding-Stellarium-without-scripting.patch | 56 +++++++++++++++++++
>  package/stellarium/stellarium.hash            |  6 +-
>  package/stellarium/stellarium.mk              |  2 +-
>  3 files changed, 60 insertions(+), 4 deletions(-)
>  create mode 100644 package/stellarium/0001-Fix-building-Stellarium-without-scripting.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
