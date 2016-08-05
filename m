From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 21:30:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/inotify-tools: Fix compilation
 with gcc6
In-Reply-To: <1469951201-1866-1-git-send-email-bernd.kuhls@t-online.de>
References: <1469951201-1866-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160805213022.07280e71@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Jul 2016 09:46:41 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/abc/abcaf70523863a4cd096a1b063be2e742355849f/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/inotify-tools/0001-gcc6.patch | 49 +++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/inotify-tools/0001-gcc6.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
