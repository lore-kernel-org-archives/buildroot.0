From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Dec 2020 14:49:34 +0100
Subject: [Buildroot] [PATCH v1 1/3] package/qt5knx: bump version to
 5.15.2 (and fix download)
In-Reply-To: <20201213111947.5385-1-ps.report@gmx.net>
References: <20201213111947.5385-1-ps.report@gmx.net>
Message-ID: <20201213144934.3ffe10f3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 13 Dec 2020 12:19:45 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - bump version to 5.15.2
> - change download url to original site
> 
> Fixes:
> 
>   - http://autobuild.buildroot.net/results/a043bb991a827880d6c743e63f070fc6a3b72a2f
> 
>   >>> qt5knx 5.15.2 Downloading[27m  
>   --2020-12-12 13:42:47--  https://github.com/qt/qtknx/archive/v5.15.2/qt5knx-5.15.2.tar.gz
>   Resolving github.com (github.com)... 140.82.114.3
>   Connecting to github.com (github.com)|140.82.114.3|:443... connected.
>   HTTP request sent, awaiting response... 302 Found
>   Location: https://codeload.github.com/qt/qtknx/tar.gz/v5.15.2/qt5knx-5.15.2 [following]
>   --2020-12-12 13:42:47--  https://codeload.github.com/qt/qtknx/tar.gz/v5.15.2/qt5knx-5.15.2
>   Resolving codeload.github.com (codeload.github.com)... 140.82.114.10
>   Connecting to codeload.github.com (codeload.github.com)|140.82.114.10|:443... connected.
>   HTTP request sent, awaiting response... 404 Not Found
>   2020-12-12 13:42:47 ERROR 404: Not Found.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/qt5knx/qt5knx.hash | 2 +-
>  package/qt5/qt5knx/qt5knx.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
