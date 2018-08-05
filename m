From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 14:16:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: fix build with gcc bug
 64735
In-Reply-To: <20180801205528.22387-1-bernd.kuhls@t-online.de>
References: <20180801205528.22387-1-bernd.kuhls@t-online.de>
Message-ID: <20180805141638.7744f927@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Aug 2018 22:55:28 +0200, Bernd Kuhls wrote:
> OpenCV3 allows to disable the usage of std::exception_ptr:
> https://github.com/opencv/opencv/issues/11878#issuecomment-402099255
> 
> Fixes
> http://autobuild.buildroot.net/results/5ca/5ca221792c72c0a19f8b0e8303c0603d28f3c48e/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/opencv3/opencv3.mk | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
