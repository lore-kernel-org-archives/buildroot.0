From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 21:44:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: revert minimum
 required ffmpeg version numbers
In-Reply-To: <1459617449-28718-1-git-send-email-bernd.kuhls@t-online.de>
References: <1459617449-28718-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160418214429.2267869c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Apr 2016 19:17:29 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/e62/e62dd4dbdb4c92bc657936566e73388e76343903/
> and many others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...g-revert-minimum-required-version-numbers.patch | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 package/tvheadend/0002-ffmpeg-revert-minimum-required-version-numbers.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
