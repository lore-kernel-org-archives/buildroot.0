From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 22:11:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/waylandpp: fix build error with
 gcc 4.4/4.9
In-Reply-To: <20180809195355.22877-1-bernd.kuhls@t-online.de>
References: <20180809195355.22877-1-bernd.kuhls@t-online.de>
Message-ID: <20180809221127.28e35ab9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Aug 2018 21:53:55 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/51a/51afcd6d3c3c4839d8216b7b0dba35c8e38211f4/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...iler-error-missing-stdexcept-to-use-.patch | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/waylandpp/0001-scanner-Fix-compiler-error-missing-stdexcept-to-use-.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
