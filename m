From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 12:55:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/aircrack-ng: needs dynamic
 library support
In-Reply-To: <20180802183202.8930-1-bernd.kuhls@t-online.de>
References: <20180802183202.8930-1-bernd.kuhls@t-online.de>
Message-ID: <20180805125528.0705b083@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Aug 2018 20:32:02 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/611/61170d12811c70037ee875434a295ac35a2a5c50/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/aircrack-ng/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
