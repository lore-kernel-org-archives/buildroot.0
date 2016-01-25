From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:31:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/transmission: fix musl build
In-Reply-To: <1453639813-18779-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453639813-18779-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160125233147.5fe1bafe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 24 Jan 2016 13:50:13 +0100, Bernd Kuhls wrote:
> The autobuilders did not catch the error yet because they failed
> earlier with other packages, but I am continuing the build based
> on the defconfig from:
> http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../transmission/0002-musl-missing-header.patch    | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/transmission/0002-musl-missing-header.patch

Applied, thanks. Please don't forget to submit the patch upstream.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
