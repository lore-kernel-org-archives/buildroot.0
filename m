From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Mar 2018 22:21:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: fix build without
 pthreads
In-Reply-To: <20180302191603.8499-1-bernd.kuhls@t-online.de>
References: <20180302191603.8499-1-bernd.kuhls@t-online.de>
Message-ID: <20180302222109.0cbd4b8d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Mar 2018 20:16:03 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.org/results/4c7/4c77c15eaa2e44d0854cf24ab872e7b2ef83ebd6/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ffmpeg/0002-ffmpeg-pthreads.patch | 34 +++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/ffmpeg/0002-ffmpeg-pthreads.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
